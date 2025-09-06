import UIKit

class Araba {
    var renk: String?
    var hiz: Int?
    var calisiyorMu: Bool?
    
    init() {
        print("Boş init metodu çalıştı")
    }
    
    init(renk: String, hiz: Int, calisiyorMu: Bool) {
        self.renk = renk
        self.hiz = hiz
        self.calisiyorMu = calisiyorMu // Shadowing
        print("Dolu init metodu çalıştı")
    }
    
    func calistir() { // Side Effect
        calisiyorMu = true
        hiz = 5
    }
    
    func durdur() {
        calisiyorMu = false
        hiz = 0
    }
    
    func hizlan(kacKm:Int) {
        hiz! += kacKm //hiz = hiz! + kackm
    }
    
    func yavasla(kacKm:Int) {
        hiz! -= kacKm //hiz = hiz! - kackm
    }
    
    func bilgiAl() {
        print("-----------------------")
        print("Renk         : \(renk!)")
        print("Hız          : \(hiz!)")
        print("Çalışıyor mu : \(calisiyorMu!)")
    }
}

// Nesne oluşturma
var bmw = Araba()
var sahin = Araba()

// Değer Atama
bmw.renk = "Kırmızı"
bmw.hiz = 200
bmw.calisiyorMu = true

sahin.renk = "Siyah"
sahin.hiz = 0
sahin.calisiyorMu = false

// Değer Okuma
print("Renk         : \(bmw.renk!)")
print("Hız          : \(bmw.hiz!)")
print("Çalışıyor Mu : \(bmw.calisiyorMu!)")
print("-----------------------")
print("Renk         : \(sahin.renk!)")
print("Hız          : \(sahin.hiz!)")
print("Çalışıyor Mu : \(sahin.calisiyorMu!)")

// Fonksiyonla bilgi Okuma
bmw.bilgiAl()
sahin.bilgiAl()

// Durdurma
bmw.bilgiAl()
bmw.durdur()
bmw.bilgiAl()

//Çalıştırma
sahin.bilgiAl()
sahin.calistir()
sahin.bilgiAl()

// Hızlanma
sahin.hizlan(kacKm: 100)
sahin.bilgiAl()

// Yavaşlama
sahin.yavasla(kacKm: 50)
sahin.bilgiAl()


// ------------------
// Normalde bmw=araba() dediğimizde () boş constructor'ı çağırıyor. Constructor aslında init diyebiliriz.

var mercedes = Araba(renk: "Kırmızı", hiz: 100, calisiyorMu: true)



class Fonksiyonlar {
    //Geri dönüş değeri olmayan ( void )
    func selamla1(){
        let sonuc = "Merhaba Ahmet"
        print(sonuc)
    }
    
    //Geri dönüş değeri olan ( return )
    func selamla2() -> String {
        let sonuc = "Merhaba Ahmet"
        return sonuc
    }
    
    //parametre
    func selamla3(isim:String){
        let sonuc = "Merhaba \(isim)"
        print(sonuc)
    }
    
    func toplama(sayi1:Int,sayi2:Int) -> Int {
        let toplam = sayi1 + sayi2
        return toplam
    }
    
    //Overloading
    func carpma(sayi1:Int,sayi2:Int) {
        print("Çarpma : \(sayi1 * sayi2)")
    }
    
    func carpma(sayi1:Double,sayi2:Double) {
        print("Çarpma : \(sayi1 * sayi2)")
    }
    
    func carpma(sayi1:Int,sayi2:Int,isim:String) {
        print("Çarpma : \(sayi1 * sayi2) - İşlemi yapan : \(isim)")
    }
}

let f = Fonksiyonlar()

f.selamla1()

let gelenSonuc = f.selamla2()
print("Gelen Sonuç : \(gelenSonuc)")


f.selamla3(isim: "Zeynep")


let gelenToplam = f.toplama(sayi1: 10, sayi2: 20)
print("Gelen Toplam : \(gelenToplam)")

f.carpma(sayi1: 3, sayi2: 5, isim: "Zeynep")



// Static Değişkenler ve Methodlar
class ASinifi {
    var x = 10
    
    func method() {
        print("Method çalıştı.")
    }
}

let a = ASinifi()
print(a.x)
a.method()

print(ASinifi().x) // Sanal Nesne - Virtual Object - İsimsiz Nesne. Bu şekilde her seferinde sanal nesne oluşturur.
ASinifi().method() // Bu şekilde her seferinde sanal nesne oluşturur. RAM'de çok yer kullanır. let a = ASinifi() demek daha mantıklı

class BSinifi {
    static let x = 10
    
    static func method() {
        print("Method çalıştı.")
    }
}

print(BSinifi.x) // Static sayesinde direkt sınıf ismiyle methoda ve değişkenlere ulaşabildik. Dikkat ettiysen BSinifi derken () kullanmadık.
BSinifi.method()

// Enumeration
enum KonserveBoyut {
    case kucuk
    case orta
    case buyuk
}

func ucretHesapla(boyut: KonserveBoyut, adet: Int) {
    switch boyut {
        case .kucuk: print("Fiyat: \(adet * 13)")
        case .orta: print("Fiyat: \(adet * 24)")
        case .buyuk: print("Fiyat: \(adet * 45)")
    }
}

ucretHesapla(boyut: .orta, adet: 1)




//Composition
class Kategoriler {
    var kategori_id:Int?
    var kategori_ad:String?
    
    init(kategori_id:Int,kategori_ad:String){
        self.kategori_id = kategori_id
        self.kategori_ad = kategori_ad
    }
}

class Yonetmenler {
    var yonetmen_id:Int?
    var yonetmen_ad:String?
    
    init(yonetmen_id:Int,yonetmen_ad:String){
        self.yonetmen_id = yonetmen_id
        self.yonetmen_ad = yonetmen_ad
    }
}

class Filmler {
    var film_id:Int?
    var film_ad:String?
    var film_yil:Int?
    var kategori:Kategoriler?
    var yonetmen:Yonetmenler?
    
    init(film_id:Int,film_ad:String,film_yil:Int,kategori:Kategoriler,yonetmen:Yonetmenler){
        self.film_id = film_id
        self.film_ad = film_ad
        self.film_yil = film_yil
        self.kategori = kategori
        self.yonetmen = yonetmen
    }
}

let k1 = Kategoriler(kategori_id: 1, kategori_ad: "Dram")
let k2 = Kategoriler(kategori_id: 2, kategori_ad: "Komedi")

let y1 = Yonetmenler(yonetmen_id: 1, yonetmen_ad: "Quentin Tarantino")
let y2 = Yonetmenler(yonetmen_id: 2, yonetmen_ad: "Christopher Nolan")

let f1 = Filmler(film_id: 1, film_ad: "Django", film_yil: 2013, kategori: k2, yonetmen: y2)

print("Film id       : \(f1.film_id!)")
print("Film ad       : \(f1.film_ad!)")
print("Film yıl      : \(f1.film_yil!)")
print("Film kategori : \(f1.kategori!.kategori_ad!)")
print("Film yöntemen : \(f1.yonetmen!.yonetmen_ad!)")
