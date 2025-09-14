//
//  KisiKayitViewModel.swift
//  P06_KisilerUygulamasi
//
//  Created by Ali Osman Öztürk on 10.09.2025.
//
import Foundation

class KisiKayitViewModel {
    var repo = KisilerDaoRepository()
    
    func kaydet(kisi_ad: String, kisi_tel: String) {
        repo.kaydet(kisi_ad: kisi_ad, kisi_tel: kisi_tel)
    }
}
