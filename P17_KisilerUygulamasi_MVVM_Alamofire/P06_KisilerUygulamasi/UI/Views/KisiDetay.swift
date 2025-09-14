//
//  KisiDetay.swift
//  P06_KisilerUygulamasi
//
//  Created by Ali Osman Öztürk on 8.09.2025.
//

import UIKit

class KisiDetay: UIViewController {

    @IBOutlet weak var tfKisiAd: UITextField!
    @IBOutlet weak var tfKisiTel: UITextField!
    
    var kisi:Kisiler?
    
    var viewModel = KisiDetayViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let kisi = kisi {
            tfKisiAd.text = kisi.kisi_ad
            tfKisiTel.text = kisi.kisi_tel
        }
    }
    
    @IBAction func buttonGuncelle(_ sender: Any) {
        if let kisiAdi = tfKisiAd.text , let kisiTel = tfKisiTel.text , let kisi = kisi {
            viewModel.guncelle(kisi_id: Int(kisi.kisi_id!)!, kisi_ad: kisiAdi, kisi_tel: kisiTel)
        }
    }


}
