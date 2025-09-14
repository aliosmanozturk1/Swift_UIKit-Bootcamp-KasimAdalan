//
//  DetaySayfa.swift
//  P08_FilmlerUygulamasi
//
//  Created by Ali Osman Öztürk on 9.09.2025.
//

import UIKit
import Kingfisher

class DetaySayfa: UIViewController {

    @IBOutlet weak var labelFilm: UILabel!
    @IBOutlet weak var imageViewFilm: UIImageView!
    @IBOutlet weak var labelFiyat: UILabel!
    
    var film: Filmler?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        if let film = film {
            labelFilm.text = film.ad
            // imageViewFilm.image = UIImage(named: film.resim!)
            
            if let url = URL(string: "http://kasimadalan.pe.hu/filmler_yeni/resimler/\(film.resim!)") {
                DispatchQueue.main.async {
                    self.imageViewFilm.kf.setImage(with: url)
                }
            }
            
            labelFiyat.text = "\(film.fiyat!)₺"
        }
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
