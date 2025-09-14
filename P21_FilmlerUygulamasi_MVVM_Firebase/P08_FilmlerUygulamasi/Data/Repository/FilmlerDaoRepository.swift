//
//  FilmlerDaoRepository.swift
//  P08_FilmlerUygulamasi
//
//  Created by Ali Osman Öztürk on 12.09.2025.
//
import Foundation
import RxSwift
import FirebaseFirestore

class FilmlerDaoRepository {
    var filmlerListesi = BehaviorSubject<[Filmler]>(value: [])
    var collectionFilmler = Firestore.firestore().collection("Filmler")
    
    func filmleriYukle() {
        collectionFilmler.getDocuments() { snapshot, error in
            var liste: [Filmler] = []
            
            if let documents = snapshot?.documents {
                for document in documents {
                    let data = document.data()
                    let film = Filmler(id: document.documentID,
                                       ad: data["isim"] as? String ?? "",
                                       resim: data["resim"] as? String ?? "",
                                       fiyat: data["fiyat"] as? Int ?? 0)
                    liste.append(film)
                }
            }
            self.filmlerListesi.onNext(liste)
        }
    }
}
