//
//  KisilerDaoRepository.swift
//  P06_KisilerUygulamasi
//
//  Created by Ali Osman Öztürk on 10.09.2025.
//

// Dao: Database Access Object

import Foundation
import RxSwift
import CoreData

class KisilerDaoRepository {
    var kisilerListesi = BehaviorSubject<[KisilerModel]>(value: [])
    
    let context = appDelegate.persistentContainer.viewContext
    
    func kaydet(kisi_ad: String, kisi_tel: String) {
        let kisi = KisilerModel(context: context)
        kisi.kisi_ad = kisi_ad
        kisi.kisi_tel = kisi_tel
        
        appDelegate.saveContext()
    }
    
    func guncelle(kisi: KisilerModel, kisi_ad: String, kisi_tel: String) {
        kisi.kisi_ad = kisi_ad
        kisi.kisi_tel = kisi_tel
        
        appDelegate.saveContext()
    }
    
    func sil(kisi: KisilerModel) {
        context.delete(kisi)
        appDelegate.saveContext()
        kisileriYukle()
    }
    
    func ara(aramaKelimesi: String) {
        do {
            let fetchRequest = KisilerModel.fetchRequest()
            fetchRequest.predicate = NSPredicate(format: "kisi_ad CONTAINS[c] %@", aramaKelimesi)
            let liste = try context.fetch(fetchRequest)
            kisilerListesi.onNext(liste) // Tetikleme
        } catch {
            print(error.localizedDescription)
        }
    }
    
    func kisileriYukle() {
        do {
            let liste = try context.fetch(KisilerModel.fetchRequest())
            kisilerListesi.onNext(liste) // Tetikleme
        } catch {
            print(error.localizedDescription)
        }
        
    }
}
