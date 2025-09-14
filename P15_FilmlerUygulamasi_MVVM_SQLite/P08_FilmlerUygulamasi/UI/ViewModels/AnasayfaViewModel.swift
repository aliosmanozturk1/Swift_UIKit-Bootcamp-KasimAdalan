//
//  AnasayfaViewModel.swift
//  P08_FilmlerUygulamasi
//
//  Created by Ali Osman Öztürk on 12.09.2025.
//
import Foundation
import RxSwift

class AnasayfaViewModel {
    var repo = FilmlerDaoRepository()
    var filmlerListesi = BehaviorSubject<[Filmler]>(value: [])

    init() {
        veritabaniKopyala()
        filmlerListesi = repo.filmlerListesi
        filmleriYukle()
    }

    func filmleriYukle() {
        repo.filmleriYukle()
    }

    func veritabaniKopyala() {
        let bundleYolu = Bundle.main.path(forResource: "filmler_app", ofType: ".sqlite")
        
        let hedefYol = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).first!
        let kopyalanacakYer = URL(fileURLWithPath: hedefYol).appendingPathComponent("filmler_app.sqlite")
        
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
