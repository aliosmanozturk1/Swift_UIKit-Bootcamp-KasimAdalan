//
//  AnasayfaVC.swift
//  P02_CalismaYapisi
//
//  Created by Ali Osman Öztürk on 7.09.2025.
//

import UIKit

class AnasayfaVC: UIViewController {

    @IBOutlet weak var labelAnasayfa: UILabel!
    
    
    override func viewDidLoad() { // Uygulama ilk açıldığında çalışır. Yalnızca 1 kere çalışır.
        super.viewDidLoad()
        labelAnasayfa.text = "Hoşgeldin"
        print("viewDidLoad çalıştı.")
    }
    
    override func viewWillAppear(_ animated: Bool) { // Sayfa her göründüğünde çalışır.
        print("viewWillAppear çalıştı.")
    }
    
    override func viewWillDisappear(_ animated: Bool) { // Sayfa her görünmez olduğunda çalışır.
        print("viewWillDisappear çalıştı.")
    }

    
    
    
    @IBAction func buttonYap(_ sender: Any) {
        labelAnasayfa.text = "Merhaba"
    }
    
    @IBAction func buttonBasla(_ sender: Any) {
        // performSegue(withIdentifier: "oyunEkraninaGecis", sender: nil) // Sadece sayfa geçişi için kullandık bunu.
        // performSegue(withIdentifier: "oyunEkraninaGecis", sender: "merhaba") // Sayfalar arasında geçerken veri aktarmak istiyorsak bunu kullanırız.
        
        
        let kisi = Kisiler(ad: "Ahmet", yas: 23, boy: 1.78, bekar: true)
        performSegue(withIdentifier: "oyunEkraninaGecis", sender: kisi)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        print("prepare metodu çalıştı")
        
        if segue.identifier == "oyunEkraninaGecis" {
            print("oyunEkraninaGecis çalıştı")
            
            if let veri1 = sender as? String {
                print("Veri : \(veri1)")
                
                let gidilecekVC = segue.destination as! OyunEkraniVC
                gidilecekVC.mesaj = veri1
            }
            
            if let veri2 = sender as? Kisiler {
                let gidilecekVC = segue.destination as! OyunEkraniVC
                gidilecekVC.kisi = veri2
            }
        }
    }
    
    
    @IBAction func buttonAdd(_ sender: Any) {
        print("Add buttona tıklandı.")
    }
    
    
    @IBAction func buttonSave(_ sender: Any) {
        print("Save buttona tıklandı.")
    }
}
