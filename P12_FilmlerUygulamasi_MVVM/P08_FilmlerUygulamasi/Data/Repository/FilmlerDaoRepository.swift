//
//  FilmlerDaoRepository.swift
//  P08_FilmlerUygulamasi
//
//  Created by Ali Osman Öztürk on 12.09.2025.
//
import Foundation
import RxSwift

class FilmlerDaoRepository {
    var filmlerListesi = BehaviorSubject<[Filmler]>(value: [])
    
    func filmleriYukle() {
        var liste: [Filmler] = []
        
        let film1 = Filmler(id: 1, ad: "Django", resim: "django", fiyat: 24)
        let film2 = Filmler(id: 2, ad: "Interstellar", resim: "interstellar", fiyat: 32)
        let film3 = Filmler(id: 3, ad: "Inception", resim: "inception", fiyat: 16)
        let film4 = Filmler(id: 4, ad: "The Hateful Eight", resim: "thehatefuleight", fiyat: 28)
        let film5 = Filmler(id: 5, ad: "The Pianist", resim: "thepianist", fiyat: 18)
        let film6 = Filmler(id: 6, ad: "Anadoluda", resim: "anadoluda", fiyat: 10)
        liste.append(film1)
        liste.append(film2)
        liste.append(film3)
        liste.append(film4)
        liste.append(film5)
        liste.append(film6)
        
        filmlerListesi.onNext(liste)
    }
}
