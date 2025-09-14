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
    var kisilerListesi = BehaviorSubject<[KisilerModel]>(value: [])
    
    init() {
        kisilerListesi = repo.kisilerListesi
        kisileriYukle()
    }
    
    func sil(kisi: KisilerModel) {
        repo.sil(kisi: kisi)
    }
    
    func ara(aramaKelimesi: String) {
        repo.ara(aramaKelimesi: aramaKelimesi)
    }
    
    func kisileriYukle() {
        repo.kisileriYukle()
    }
}
