//
//  AnasayfaViewModel.swift
//  P06_KisilerUygulamasi
//
//  Created by Ali Osman Öztürk on 10.09.2025.
//
import Foundation
import RxSwift

class AnasayfaViewModel {
    var repo = KisilerDaoRepository()
    var kisilerListesi = BehaviorSubject<[Kisiler]>(value: [])
    
    init() {
        veritabaniKopyala()
        kisilerListesi = repo.kisilerListesi
        kisileriYukle()
    }
    
    func sil(kisi_id: Int) {
        repo.sil(kisi_id: kisi_id)
    }
    
    func ara(aramaKelimesi: String) {
        repo.ara(aramaKelimesi: aramaKelimesi)
    }
    
    func kisileriYukle() {
        repo.kisileriYukle()
    }
    
    func veritabaniKopyala() {
        let bundleYolu = Bundle.main.path(forResource: "rehber", ofType: ".sqlite")
        let hedefYol = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).first!
        let kopyalanacakYer = URL(fileURLWithPath: hedefYol).appendingPathComponent("rehber.sqlite")
        let fileManager = FileManager.default
        if fileManager.fileExists(atPath: kopyalanacakYer.path) {
            print("Veritabanı zaten var")
        } else {
            do {
                try fileManager.copyItem(atPath: bundleYolu!, toPath: kopyalanacakYer.path)
            } catch {}
        }
    }
}
