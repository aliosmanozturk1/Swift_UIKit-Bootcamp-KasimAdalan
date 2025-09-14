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
        filmlerListesi = repo.filmlerListesi
        filmleriYukle()
    }
    
    func filmleriYukle() {
        repo.filmleriYukle()
    }
}
