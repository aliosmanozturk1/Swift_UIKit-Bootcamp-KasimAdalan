//
//  ViewController.swift
//  P13_UserDefaultKullanimi
//
//  Created by Ali Osman Öztürk on 12.09.2025.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var labelSayac: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Tanımlama
        let userDefaults = UserDefaults.standard
        
        // Kayıt
        userDefaults.set("Ahmet", forKey: "ad")
        userDefaults.set(23, forKey: "yas")
        userDefaults.set(1.78, forKey: "boy")
        userDefaults.set(true, forKey: "bekar")
        
        let liste = ["ali", "beyza"]
        userDefaults.set(liste, forKey: "liste")
        
        let sehirler = ["16": "Bursa", "34": "İstanbul"]
        userDefaults.set(sehirler, forKey: "sehirler")
        
        // Silme
        // userDefaults.removeObject(forKey: "ad")
        
        //Okuma
        let gelenAd = userDefaults.string(forKey: "ad") ?? "İsim Yok"
        let gelenYas = userDefaults.integer(forKey: "yas") // Veriyi çekemezse default olarak 0 olur.
        let gelenBoy = userDefaults.double(forKey: "boy") // Veriyi çekemezse default olarak 0.0 olur.
        // let gelenBoy: Double = userDefaults.value(forKey: "boy") as! Double // Xcode önerdi güzele benziyor, kalsın burda.
        let gelenBekar = userDefaults.bool(forKey: "bekar") // Veriyi çekemezse default olarak false olur.
        let gelenListe = userDefaults.array(forKey: "liste") ?? [] // Hoca şunu önerdi. [String]() yani string türünde boş bir array.
        let gelenSehirler = userDefaults.dictionary(forKey: "sehirler") ?? [:] // Hoca şunu önerdi. [String:String]() yani boş bir dictionary
        
        print("Gelen Ad     : \(gelenAd)")
        print("Gelen Yaş    : \(gelenYas)")
        print("Gelen Boy    : \(gelenBoy)")
        print("Gelen Bekar  : \(gelenBekar)")
        
        for i in gelenListe {
            print("Gelen Liste  : \(i)")
        }
        
        for (key, value) in gelenSehirler {
            print("Gelen Şehir  : \(key) -> \(value)")
        }
        
        // ------------
        
        // Sayaç Uygulaması
        var sayac = userDefaults.integer(forKey: "sayac")
        sayac += 1
        userDefaults.set(sayac, forKey: "sayac")
        labelSayac.text = "Açılış Sayısı: \(sayac)"
        
        
    }
    

}

