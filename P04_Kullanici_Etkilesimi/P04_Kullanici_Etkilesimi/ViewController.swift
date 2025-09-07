//
//  ViewController.swift
//  P04_Kullanici_Etkilesimi
//
//  Created by Ali Osman Öztürk on 7.09.2025.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func buttonAlert(_ sender: Any) {
        let alertController = UIAlertController(title: "Başlık", message: "Mesaj", preferredStyle: .alert)
        
        let iptalAction = UIAlertAction(title: "İptal", style: .cancel)
        alertController.addAction(iptalAction)
        
        let tamamAction = UIAlertAction(title: "Tamam", style: .destructive)
        alertController.addAction(tamamAction)
        
        self.present(alertController, animated: true)
    }
    
    
    @IBAction func buttonActionSheet(_ sender: Any) {
        let alertController = UIAlertController(title: "Başlık", message: "Mesaj", preferredStyle: .actionSheet)
        
        let iptalAction = UIAlertAction(title: "İptal", style: .cancel)
        alertController.addAction(iptalAction)
        
        let tamamAction = UIAlertAction(title: "Tamam", style: .destructive)
        alertController.addAction(tamamAction)
        
        self.present(alertController, animated: true)
    }
    
    
    @IBAction func buttonOzelAlert(_ sender: Any) {
        let alertController = UIAlertController(title: "Başlık", message: "Mesaj", preferredStyle: .alert)
        
        alertController.addTextField { textField in
            textField.placeholder = "Adı Giriniz"
            textField.keyboardType = .numberPad
            textField.isSecureTextEntry = true
        }
        
        let tamamAction = UIAlertAction(title: "Kaydet", style: .default) { action in
            let textField = alertController.textFields![0] as UITextField
            
            if let alinanVeri = textField.text {
                print("Alınan Veri: \(alinanVeri)")
            }
            
            print("Tamam Seçildi.")
        }
        alertController.addAction(tamamAction)
        
        self.present(alertController, animated: true)
    }
}

