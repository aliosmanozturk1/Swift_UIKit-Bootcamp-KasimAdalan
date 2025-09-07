//
//  OyunEkraniVC.swift
//  P02_CalismaYapisi
//
//  Created by Ali Osman Öztürk on 7.09.2025.
//

import UIKit

class OyunEkraniVC: UIViewController {
    
    var mesaj: String?
    var kisi: Kisiler?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let mesaj = mesaj {
            print("OyunEkraniVC'de mesaj: \(mesaj)")
        }
        
        if let kisi = kisi {
            print("--- OyunEkraniVC ---")
            print("Kişi adı   : \(kisi.ad!)")
            print("Kişi yaşı  : \(kisi.yas!)")
            print("Kişi boyu  : \(kisi.boy!)")
            print("Kişi bekar : \(kisi.bekar!)")
        }
        
    }
    
    @IBAction func buttonBitir(_ sender: Any) {
        performSegue(withIdentifier: "sonucEkraninaGecis", sender: nil)
    }
    
    @IBAction func buttonGeri(_ sender: Any) {
        // navigationController?.popViewController(animated: true) // Bir önceki sayfaya dönmeyi sağlar.
        navigationController?.popToRootViewController(animated: true) // Root View'e dönmeyi sağlar.
    }
}
