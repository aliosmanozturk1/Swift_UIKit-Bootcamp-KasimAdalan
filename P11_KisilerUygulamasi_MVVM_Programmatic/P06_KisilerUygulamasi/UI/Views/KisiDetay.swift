//
//  KisiDetay.swift
//  P06_KisilerUygulamasi
//
//  Created by Ali Osman Öztürk on 8.09.2025.
//

import UIKit

class KisiDetay: UIViewController {

    private var tfKisiAd: UITextField!
    private var tfKisiTel: UITextField!
    private var buttonGuncelle: UIButton!
    
    var kisi:Kisiler?
    
    var viewModel = KisiDetayViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
        setupConstraints()
        setupNavigationBar()
        
        if let kisi = kisi {
            tfKisiAd.text = kisi.kisi_ad
            tfKisiTel.text = kisi.kisi_tel
        }
    }
    
    private func setupUI() {
        view.backgroundColor = .systemBackground
        
        tfKisiAd = UITextField()
        tfKisiAd.translatesAutoresizingMaskIntoConstraints = false
        tfKisiAd.borderStyle = .roundedRect
        tfKisiAd.placeholder = "Adınızı giriniz..."
        tfKisiAd.textAlignment = .center
        tfKisiAd.font = .systemFont(ofSize: 25)
        
        tfKisiTel = UITextField()
        tfKisiTel.translatesAutoresizingMaskIntoConstraints = false
        tfKisiTel.borderStyle = .roundedRect
        tfKisiTel.placeholder = "Telefonunuzu giriniz..."
        tfKisiTel.textAlignment = .center
        tfKisiTel.font = .systemFont(ofSize: 25)
        
        buttonGuncelle = UIButton(type: .system)
        buttonGuncelle.translatesAutoresizingMaskIntoConstraints = false
        buttonGuncelle.setTitle("Güncelle", for: .normal)
        buttonGuncelle.titleLabel?.font = UIFont(name: "Helvetica", size: 25)
        buttonGuncelle.addTarget(self, action: #selector(buttonGuncelleTapped), for: .touchUpInside)
        
        view.addSubview(tfKisiAd)
        view.addSubview(tfKisiTel)
        view.addSubview(buttonGuncelle)
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            tfKisiAd.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 50),
            tfKisiAd.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 50),
            tfKisiAd.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -50),
            tfKisiAd.heightAnchor.constraint(equalToConstant: 40),
            
            tfKisiTel.topAnchor.constraint(equalTo: tfKisiAd.bottomAnchor, constant: 50),
            tfKisiTel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 50),
            tfKisiTel.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -50),
            tfKisiTel.heightAnchor.constraint(equalToConstant: 40),
            
            buttonGuncelle.topAnchor.constraint(equalTo: tfKisiTel.bottomAnchor, constant: 50),
            buttonGuncelle.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 50),
            buttonGuncelle.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -50),
            buttonGuncelle.heightAnchor.constraint(equalToConstant: 43),
        ])
    }
    
    private func setupNavigationBar() {
        navigationItem.title = "Kişi Detay"
    }
    
    @objc private func buttonGuncelleTapped() {
        if let kisiAdi = tfKisiAd.text , let kisiTel = tfKisiTel.text , let kisi = kisi {
            viewModel.guncelle(kisi_id: kisi.kisi_id!, kisi_ad: kisiAdi, kisi_tel: kisiTel)
        }
    }
}

#Preview {
    KisiDetay()
}

