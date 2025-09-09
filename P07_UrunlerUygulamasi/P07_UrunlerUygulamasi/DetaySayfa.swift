//
//  DetaySayfa.swift
//  P07_UrunlerUygulamasi
//
//  Created by Ali Osman Öztürk on 9.09.2025.
//

import UIKit

class DetaySayfa: UIViewController {

    @IBOutlet weak var imageViewUrun: UIImageView!
    @IBOutlet weak var labelUrunFiyat: UILabel!

    var urun: Urunler?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let urun = urun {
            self.navigationItem.title = urun.ad
            imageViewUrun.image = UIImage(named: urun.resim!)
            labelUrunFiyat.text = "\(urun.fiyat!)₺"
        }

        // Do any additional setup after loading the view.
    }
    
    @IBAction func buttonSepeteEkle(_ sender: Any) {
        if let urun = urun {
            print("\(urun.ad!) Sepete eklendi.")
        }
    }
    
}
