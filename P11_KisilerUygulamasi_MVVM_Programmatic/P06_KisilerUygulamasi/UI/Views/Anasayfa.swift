//
//  ViewController.swift
//  P06_KisilerUygulamasi
//
//  Created by Ali Osman Öztürk on 8.09.2025.
//

import UIKit

class Anasayfa: UIViewController {

    private var searchBar: UISearchBar! // Bunu kullanmak için class'ına UISearchBarDelegate protocolünü ekle.
    private var kisilerTableView: UITableView!
    
    var kisilerListesi: [Kisiler] = []
    
    var viewModel = AnasayfaViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
        setupConstraints()
        setupNavigationBar()
        setupDelegates()
        
        _ = viewModel.kisilerListesi.subscribe(onNext: {liste in // Dinleme
            self.kisilerListesi = liste
            self.kisilerTableView.reloadData()
        })
    }
    
    override func viewWillAppear(_ animated: Bool) {
        print("Anasayfa dönüldü.")
        viewModel.kisileriYukle()
        
    }
    
    private func setupUI() {
        view.backgroundColor = .systemBackground
        
        searchBar = UISearchBar()
        searchBar.translatesAutoresizingMaskIntoConstraints = false
        
        kisilerTableView = UITableView()
        kisilerTableView.translatesAutoresizingMaskIntoConstraints = false
        kisilerTableView.rowHeight = 100
        kisilerTableView.register(KisilerHucre.self, forCellReuseIdentifier: "kisilerHucre") // GELCEZ BURAYA TODO
        
        view.addSubview(searchBar)
        view.addSubview(kisilerTableView)
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            searchBar.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            searchBar.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            searchBar.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            
            kisilerTableView.topAnchor.constraint(equalTo: searchBar.bottomAnchor),
            kisilerTableView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            kisilerTableView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            kisilerTableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
    }
    
    private func setupDelegates() {
        searchBar.delegate = self
        kisilerTableView.delegate = self
        kisilerTableView.dataSource = self
    }
    
    private func setupNavigationBar() {
        title = "Kişiler"
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addButtonTapped))
    }
    
    @objc private func addButtonTapped() {
        let kisiKayit = KisiKayit()
        navigationController?.pushViewController(kisiKayit, animated: true)
    }

}

extension Anasayfa: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        viewModel.ara(aramaKelimesi: searchText)
    }
}

extension Anasayfa: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return kisilerListesi.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let kisi = kisilerListesi[indexPath.row]
        
        let hucre = tableView.dequeueReusableCell(withIdentifier: "kisilerHucre") as! KisilerHucre
        
        hucre.labelKisiAd.text = kisi.kisi_ad
        hucre.labelKisiTel.text = kisi.kisi_tel
        
        return hucre
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let kisi = kisilerListesi[indexPath.row]
        print("\(kisi.kisi_ad!) seçildi.")
        
        let kisiDetay = KisiDetay()
        kisiDetay.kisi = kisi
        navigationController?.pushViewController(kisiDetay, animated: true)

        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let silAction = UIContextualAction(style: .destructive, title: "Sil") { contextualAction, view, bool in
            let kisi = self.kisilerListesi[indexPath.row]
            
            let alert = UIAlertController(title: "Silme Onayı", message: "\(kisi.kisi_ad!) kişisini silmek istediğinize emin misiniz?", preferredStyle: .alert)
            
            let iptalAction = UIAlertAction(title: "İptal", style: .cancel)
            let silAction = UIAlertAction(title: "Sil", style: .destructive) { _ in
                self.viewModel.sil(kisi_id: kisi.kisi_id!)
                // self.kisilerListesi.remove(at: indexPath.row)
                // tableView.deleteRows(at: [indexPath], with: .fade)
            }
            
            alert.addAction(iptalAction)
            alert.addAction(silAction)
            
            self.present(alert, animated: true)
        }
        
        return UISwipeActionsConfiguration(actions: [silAction])
    }
}

#Preview {
    Anasayfa()
}
