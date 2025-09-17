//
//  KisiKayit.swift
//  P06_KisilerUygulamasi
//
//  Created by Ali Osman Öztürk on 8.09.2025.
//

import UIKit

class KisiKayit: UIViewController {

    private var tfKisiAd: UITextField!
    private var tfKisiTel: UITextField!
    private var buttonKaydet: UIButton!
    
    var viewModel = KisiKayitViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
        setupConstraints()
        setupNavigationBar()
    }
    
    private func setupUI() {
        view.backgroundColor = .systemBackground
        
        tfKisiAd = UITextField()
        tfKisiAd.translatesAutoresizingMaskIntoConstraints = false
        tfKisiAd.borderStyle = .roundedRect
        tfKisiAd.placeholder = "Adınızı giriniz..."
        tfKisiAd.textAlignment = .center
        tfKisiAd.font = UIFont.systemFont(ofSize: 25)
        
        tfKisiTel = UITextField()
        tfKisiTel.translatesAutoresizingMaskIntoConstraints = false
        tfKisiTel.borderStyle = .roundedRect
        tfKisiTel.placeholder = "Telefonunuzu giriniz..."
        tfKisiTel.textAlignment = .center
        tfKisiTel.font = UIFont.systemFont(ofSize: 25)
        
        buttonKaydet = UIButton(type: .system)
        buttonKaydet.translatesAutoresizingMaskIntoConstraints = false
        buttonKaydet.setTitle("Kaydet", for: .normal)
        buttonKaydet.titleLabel?.font = UIFont(name: "Helvetica", size: 25)
        buttonKaydet.addTarget(self, action: #selector(buttonKaydetTapped), for: .touchUpInside)
        
        view.addSubview(tfKisiAd)
        view.addSubview(tfKisiTel)
        view.addSubview(buttonKaydet)
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
            
            buttonKaydet.topAnchor.constraint(equalTo: tfKisiTel.bottomAnchor, constant: 50),
            buttonKaydet.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            buttonKaydet.heightAnchor.constraint(equalToConstant: 43)
        ])
    }
    
    private func setupNavigationBar() {
        title = "Kişi Kayıt"
    }

    @objc func buttonKaydetTapped() {
        if let kisiAdi = tfKisiAd.text, let kisiTel = tfKisiTel.text {
            viewModel.kaydet(kisi_ad: kisiAdi, kisi_tel: kisiTel)
        }
    }
    
}

#Preview {
    KisiKayit()
}
