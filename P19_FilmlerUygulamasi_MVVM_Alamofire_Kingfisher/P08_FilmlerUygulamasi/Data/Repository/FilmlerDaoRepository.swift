//
//  FilmlerDaoRepository.swift
//  P08_FilmlerUygulamasi
//
//  Created by Ali Osman Öztürk on 12.09.2025.
//
import Foundation
import RxSwift
import Alamofire
import Kingfisher

class FilmlerDaoRepository {
    var filmlerListesi = BehaviorSubject<[Filmler]>(value: [])
    
    func filmleriYukle() {
        AF.request("http://kasimadalan.pe.hu/filmler_yeni/tum_filmler.php", method: .get).response { response in
            if let data = response.data {
                do {
                    let cevap = try JSONDecoder().decode(FilmlerCevap.self, from: data)
                    if let liste = cevap.filmler {
                        self.filmlerListesi.onNext(liste)
                    }
                } catch {
                    print("Hata: \(error.localizedDescription)")
                }
            }
        }
    }
}
