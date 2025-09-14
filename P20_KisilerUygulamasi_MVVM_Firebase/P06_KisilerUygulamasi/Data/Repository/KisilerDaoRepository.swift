//
//  KisilerDaoRepository.swift
//  P06_KisilerUygulamasi
//
//  Created by Ali Osman Öztürk on 10.09.2025.
//

// Dao: Database Access Object

import Foundation
import RxSwift
import FirebaseFirestore

class KisilerDaoRepository {
    var kisilerListesi = BehaviorSubject<[Kisiler]>(value: [])
    var collecttionKisiler = Firestore.firestore().collection("Kisiler")
    
    func kaydet(kisi_ad: String, kisi_tel: String) {
        let yeniKisi: [String: Any] = ["kisi_id": "", "kisi_ad": kisi_ad, "kisi_tel": kisi_tel]
        collecttionKisiler.document().setData(yeniKisi)
    }
    
    func guncelle(kisi_id: String, kisi_ad: String, kisi_tel: String) {
        let guncellenenKisi: [String: Any] = ["kisi_ad": kisi_ad, "kisi_tel": kisi_tel]
        collecttionKisiler.document(kisi_id).updateData(guncellenenKisi)
    }
    
    func sil(kisi_id: String) {
        collecttionKisiler.document(kisi_id).delete()
    }
    
    func ara(aramaKelimesi: String) {
        collecttionKisiler.addSnapshotListener { snapshot, error in
            var liste: [Kisiler] = []
            
            if let documents = snapshot?.documents {
                for document in documents {
                    let data = document.data()
                    let kisi_id = document.documentID
                    let kisi_ad = data["kisi_ad"] as? String ?? ""
                    let kisi_tel = data["kisi_tel"] as? String ?? ""
                    
                    if kisi_ad.lowercased().contains(aramaKelimesi.lowercased()) == false {
                        continue
                    }
                    
                    let kisi = Kisiler(kisi_id: kisi_id, kisi_ad: kisi_ad, kisi_tel: kisi_tel)
                    liste.append(kisi)
                }
            }
            
            self.kisilerListesi.onNext(liste) // Tetikleme
        }
    }
    
    func kisileriYukle() {
        collecttionKisiler.addSnapshotListener { snapshot, error in
            var liste: [Kisiler] = []
            
            if let documents = snapshot?.documents {
                for document in documents {
                    let data = document.data()
                    let kisi_id = document.documentID
                    let kisi_ad = data["kisi_ad"] as? String ?? ""
                    let kisi_tel = data["kisi_tel"] as? String ?? ""
                    
                    let kisi = Kisiler(kisi_id: kisi_id, kisi_ad: kisi_ad, kisi_tel: kisi_tel)
                    liste.append(kisi)
                }
            }
            
            self.kisilerListesi.onNext(liste) // Tetikleme
        }
    }
}
