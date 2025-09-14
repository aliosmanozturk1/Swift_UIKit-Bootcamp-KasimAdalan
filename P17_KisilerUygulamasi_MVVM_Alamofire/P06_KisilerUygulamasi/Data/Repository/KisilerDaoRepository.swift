//
//  KisilerDaoRepository.swift
//  P06_KisilerUygulamasi
//
//  Created by Ali Osman Öztürk on 10.09.2025.
//

// Dao: Database Access Object

import Foundation
import RxSwift
import Alamofire

class KisilerDaoRepository {
    var kisilerListesi = BehaviorSubject<[Kisiler]>(value: [])
    
    func kaydet(kisi_ad: String, kisi_tel: String) {
        let params: Parameters = ["kisi_ad": kisi_ad, "kisi_tel": kisi_tel]
        
        AF.request("http://kasimadalan.pe.hu/kisiler/insert_kisiler.php", method: .post, parameters: params).response { response in
            if let data = response.data {
                do {
                    let cevap = try JSONDecoder().decode(CRUDCevap.self, from: data)
                    print("Success durumu: \(cevap.success!)")
                    print("Message: \(cevap.message!)")
                } catch {
                    print(error.localizedDescription)
                }
            }
        }
    }
    
    func guncelle(kisi_id: Int, kisi_ad: String, kisi_tel: String) {
        let params: Parameters = ["kisi_id": kisi_id, "kisi_ad": kisi_ad, "kisi_tel": kisi_tel]
        
        AF.request("http://kasimadalan.pe.hu/kisiler/update_kisiler.php", method: .post, parameters: params).response { response in
            if let data = response.data {
                do {
                    let cevap = try JSONDecoder().decode(CRUDCevap.self, from: data)
                    print("Success durumu: \(cevap.success!)")
                    print("Message: \(cevap.message!)")
                } catch {
                    print(error.localizedDescription)
                }
            }
        }
    }
    
    func sil(kisi_id: Int) {
        let params: Parameters = ["kisi_id": kisi_id]
        
        AF.request("http://kasimadalan.pe.hu/kisiler/delete_kisiler.php", method: .post, parameters: params).response { response in
            if let data = response.data {
                do {
                    let cevap = try JSONDecoder().decode(CRUDCevap.self, from: data)
                    print("Success durumu: \(cevap.success!)")
                    print("Message: \(cevap.message!)")
                    self.kisileriYukle()
                } catch {
                    print(error.localizedDescription)
                }
            }
        }
    }
    
    func ara(aramaKelimesi: String) {
        let params: Parameters = ["kisi_ad": aramaKelimesi]
        
        AF.request("http://kasimadalan.pe.hu/kisiler/tum_kisiler_arama.php", method: .post, parameters: params).response { response in
            if let data = response.data {
                do {
                    let cevap = try JSONDecoder().decode(KisilerCevap.self, from: data)
                    if let liste = cevap.kisiler {
                        self.kisilerListesi.onNext(liste)
                    }
                } catch {
                    print(error.localizedDescription)
                }
            }
        }
    }
    
    func kisileriYukle() {
        AF.request("http://kasimadalan.pe.hu/kisiler/tum_kisiler.php", method: .get).response { response in
            if let data = response.data {
                do {
                    let cevap = try JSONDecoder().decode(KisilerCevap.self, from: data)
                    if let liste = cevap.kisiler {
                        self.kisilerListesi.onNext(liste)
                    }
                } catch {
                    print(error.localizedDescription)
                }
            }
        }
    }
}
