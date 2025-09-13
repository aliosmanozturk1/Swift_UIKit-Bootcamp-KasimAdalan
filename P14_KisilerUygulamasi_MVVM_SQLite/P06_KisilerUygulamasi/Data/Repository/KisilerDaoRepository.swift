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
    
    let db: FMDatabase?
    
    init() {
        let hedefYol = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).first!
        let veritabaniURL = URL(fileURLWithPath: hedefYol).appendingPathComponent("rehber.sqlite")
        
        db = FMDatabase(path: veritabaniURL.path())
    }
    
    func kaydet(kisi_ad: String, kisi_tel: String) {
        db?.open()
        
        do {
            try db!.executeUpdate("INSERT INTO kisiler (kisi_ad, kisi_tel) VALUES (?,?)", values: [kisi_ad, kisi_tel])

        } catch {
            print(error.localizedDescription)
        }
        db?.close()
    }
    
    func guncelle(kisi_id: Int, kisi_ad: String, kisi_tel: String) {
        db?.open()
        
        do {
            try db!.executeUpdate("UPDATE kisiler SET kisi_ad = ?, kisi_tel = ? WHERE kisi_id = ?", values: [kisi_ad, kisi_tel, kisi_id])

        } catch {
            print(error.localizedDescription)
        }
        db?.close()
    }
    
    func sil(kisi_id: Int) {
        db?.open()
        
        do {
            try db!.executeUpdate("DELETE FROM kisiler WHERE kisi_id = ?", values: [kisi_id])
            kisileriYukle()

        } catch {
            print(error.localizedDescription)
        }
        db?.close()
    }
    
    func ara(aramaKelimesi: String) {
        db?.open()
        var liste: [Kisiler] = []
        
        do {
            let result = try db!.executeQuery("SELECT * FROM kisiler WHERE kisi_ad like '%\(aramaKelimesi)%'", values: nil)
            
            while result.next() {
                let kisi = Kisiler(
                    kisi_id: Int(result.string(forColumn: "kisi_id"))!,
                    kisi_ad: result.string(forColumn: "kisi_ad")!,
                    kisi_tel: result.string(forColumn: "kisi_tel")!
                )
                liste.append(kisi)
            }
            
            kisilerListesi.onNext(liste) // Tetikleme
            
        } catch {
            print(error.localizedDescription)
        }
        db?.close()
    }
    
    func kisileriYukle() {
        db?.open()
        var liste: [Kisiler] = []
        
        do {
            let result = try db!.executeQuery("SELECT * FROM kisiler", values: nil)
            
            while result.next() {
                let kisi = Kisiler(
                    kisi_id: Int(result.string(forColumn: "kisi_id"))!,
                    kisi_ad: result.string(forColumn: "kisi_ad")!,
                    kisi_tel: result.string(forColumn: "kisi_tel")!
                )
                liste.append(kisi)
            }
            
            kisilerListesi.onNext(liste) // Tetikleme
            
        } catch {
            print(error.localizedDescription)
        }
        db?.close()
    }
}
