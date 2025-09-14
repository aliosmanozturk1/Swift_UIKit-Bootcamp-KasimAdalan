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
        kisilerListesi = repo.kisilerListesi
        kisileriYukle()
    }
    
    func sil(kisi_id: String) {
        repo.sil(kisi_id: kisi_id)
    }
    
    func ara(aramaKelimesi: String) {
        repo.ara(aramaKelimesi: aramaKelimesi)
    }
    
    func kisileriYukle() {
        repo.kisileriYukle()
    }
}
