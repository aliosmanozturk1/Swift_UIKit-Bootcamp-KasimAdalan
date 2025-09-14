//
//  FilmlerHucre.swift
//  P08_FilmlerUygulamasi
//
//  Created by Ali Osman Öztürk on 9.09.2025.
//

import UIKit

protocol HucreProtocol {
    func sepeteEkleTikla(indexPath: IndexPath)
}


class FilmlerHucre: UICollectionViewCell {
    @IBOutlet weak var imageViewFilm: UIImageView!
    @IBOutlet weak var labelFiyat: UILabel!
    
    var hucreProtocol: HucreProtocol?
    var indexPath: IndexPath?
    
    @IBAction func buttonSepeteEkle(_ sender: Any) {
        hucreProtocol?.sepeteEkleTikla(indexPath: indexPath!)
    }
}
