//
//  KisiKayit.swift
//  P06_KisilerUygulamasi
//
//  Created by Ali Osman Öztürk on 8.09.2025.
//

import UIKit

class KisiKayit: UIViewController {

    @IBOutlet weak var tfKisiAd: UITextField!
    @IBOutlet weak var tfKisiTel: UITextField!
    
    var viewModel = KisiKayitViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func buttonKaydet(_ sender: Any) {
        if let kisiAdi = tfKisiAd.text, let kisiTel = tfKisiTel.text {
            viewModel.kaydet(kisi_ad: kisiAdi, kisi_tel: kisiTel)
        }
    }
    
}
