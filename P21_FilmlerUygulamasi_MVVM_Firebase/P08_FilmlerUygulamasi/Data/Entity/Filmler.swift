//
//  Filmler.swift
//  P08_FilmlerUygulamasi
//
//  Created by Ali Osman Öztürk on 9.09.2025.
//

class Filmler {
    var id: String?
    var ad: String?
    var resim: String?
    var fiyat: Int?
    
    init() {}
    
    init(id: String, ad: String, resim: String, fiyat: Int) {
        self.id = id
        self.ad = ad
        self.resim = resim
        self.fiyat = fiyat
    }
}
