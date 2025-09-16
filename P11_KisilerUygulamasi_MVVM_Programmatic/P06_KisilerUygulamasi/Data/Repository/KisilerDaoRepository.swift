//
//  KisilerDaoRepository.swift
//  P06_KisilerUygulamasi
//
//  Created by Ali Osman Öztürk on 10.09.2025.
//

// Dao: Database Access Object

import Foundation
import RxSwift

class KisilerDaoRepository {
    var kisilerListesi = BehaviorSubject<[Kisiler]>(value: [])
    
    func kaydet(kisi_ad: String, kisi_tel: String) {
        print("Kişi Kaydet: \(kisi_ad), \(kisi_tel)")
    }
    
    func guncelle(kisi_id: Int, kisi_ad: String, kisi_tel: String) {
        print("Kişi Güncelle: \(kisi_id), \(kisi_ad), \(kisi_tel)")
    }
    
    func sil(kisi_id: Int) {
        print("Kişi Sil: \(kisi_id)")
    }
    
    func ara(aramaKelimesi: String) {
        print("Kişi Ara: \(aramaKelimesi)")
    }
    
    func kisileriYukle() {
        var liste: [Kisiler] = []
        
        let kisi1 = Kisiler(kisi_id: 1, kisi_ad: "Ahmet", kisi_tel: "1111")
        let kisi2 = Kisiler(kisi_id: 1, kisi_ad: "Zeynep", kisi_tel: "2222")
        let kisi3 = Kisiler(kisi_id: 1, kisi_ad: "Beyza", kisi_tel: "3333")
        
        liste.append(kisi1)
        liste.append(kisi2)
        liste.append(kisi3)
        
        kisilerListesi.onNext(liste) // Tetikleme
    }
}
