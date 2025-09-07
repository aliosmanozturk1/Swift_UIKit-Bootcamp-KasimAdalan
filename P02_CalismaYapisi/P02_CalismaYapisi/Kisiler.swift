//
//  Kisiler.swift
//  P02_CalismaYapisi
//
//  Created by Ali Osman Öztürk on 7.09.2025.
//

import Foundation

class Kisiler {
    var ad: String?
    var yas: Int?
    var boy: Double?
    var bekar: Bool?
    
    init() {}
    
    init(ad: String, yas: Int, boy: Double, bekar: Bool) {
        self.ad = ad
        self.yas = yas
        self.boy = boy
        self.bekar = bekar
    }
}
