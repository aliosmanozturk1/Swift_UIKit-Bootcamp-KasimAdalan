//
//  ViewController.swift
//  P06_KisilerUygulamasi
//
//  Created by Ali Osman Öztürk on 8.09.2025.
//

import UIKit

class Anasayfa: UIViewController {

    @IBOutlet weak var searchBar: UISearchBar! // Bunu kullanmak için class'ına UISearchBarDelegate protocolünü ekle.
    @IBOutlet weak var kisilerTableView: UITableView!
    
    var kisilerListesi: [Kisiler] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        searchBar.delegate = self
        kisilerTableView.delegate = self
        kisilerTableView.dataSource = self
        
        let kisi1 = Kisiler(kisi_id: 1, kisi_ad: "Ahmet", kisi_tel: "1111")
        let kisi2 = Kisiler(kisi_id: 1, kisi_ad: "Zeynep", kisi_tel: "2222")
        let kisi3 = Kisiler(kisi_id: 1, kisi_ad: "Beyza", kisi_tel: "3333")
        
        kisilerListesi.append(kisi1)
        kisilerListesi.append(kisi2)
        kisilerListesi.append(kisi3)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        print("Anasayfa dönüldü.")
    }


    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toDetay" {
            if let kisi = sender as? Kisiler {
                let gidilecekVC = segue.destination as! KisiDetay
                gidilecekVC.kisi = kisi
            }
        }
    }
}

extension Anasayfa: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        print("Kişi Ara: \(searchText)")
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
        
        performSegue(withIdentifier: "toDetay", sender: kisi)
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let silAction = UIContextualAction(style: .destructive, title: "Sil") { contextualAction, view, bool in
            let kisi = self.kisilerListesi[indexPath.row]
            
            let alert = UIAlertController(title: "Silme Onayı", message: "\(kisi.kisi_ad!) kişisini silmek istediğinize emin misiniz?", preferredStyle: .alert)
            
            let iptalAction = UIAlertAction(title: "İptal", style: .cancel)
            let silAction = UIAlertAction(title: "Sil", style: .destructive) { _ in
                print("Kişi silindi: \(kisi.kisi_id!)")
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
