//
//  KisiDetayViewModel.swift
//  P06_KisilerUygulamasi
//
//  Created by Ali Osman Öztürk on 10.09.2025.
//
import Foundation

class KisiDetayViewModel {
    var repo = KisilerDaoRepository()
    
    func guncelle(kisi_id: Int, kisi_ad: String, kisi_tel: String) {
        repo.guncelle(kisi_id: kisi_id, kisi_ad: kisi_ad, kisi_tel: kisi_tel)
    }
    
}
