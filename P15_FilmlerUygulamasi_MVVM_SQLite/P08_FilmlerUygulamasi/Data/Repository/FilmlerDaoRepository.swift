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
    
    let db: FMDatabase?
    
    init() {
        let hedefYol = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).first!
        let veritabaniURL = URL(fileURLWithPath: hedefYol).appendingPathComponent("filmler_app.sqlite")
        db = FMDatabase(path: veritabaniURL.path())
    }
    
    func filmleriYukle() {
        db?.open()
        var liste: [Filmler] = []
        
        do {
            let result = try db!.executeQuery("SELECT * FROM filmler", values: nil)
            
            while result.next() {
                let film = Filmler(id: Int(result.string(forColumn: "id"))!,
                                   ad: result.string(forColumn: "ad")!,
                                   resim: result.string(forColumn: "resim")!,
                                   fiyat: Int(result.string(forColumn: "fiyat"))!)
                liste.append(film)
             }
            
            filmlerListesi.onNext(liste)
        } catch {
            print(error.localizedDescription)
        }
        
        db?.close()
    }
}
