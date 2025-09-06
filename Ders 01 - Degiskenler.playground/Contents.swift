import UIKit

print("Merhaba Dünya!")


var ogrenciAdi = "Ali"
var ogrenciYas = 24
var ogrenciBoy = 1.81
var ogrenciBasHarf = "A"
var ogrenciDevamEdiyorMu = true

print(ogrenciAdi)
print(ogrenciYas)
print(ogrenciBoy)
print(ogrenciBasHarf)
print(ogrenciDevamEdiyorMu)


var urun_id : Int = 34156
var urun_adi : String = "MacBook Pro"
var urun_adet : Int = 100
var urun_fiyat : Int = 34999
var urun_tedarikci : String = "Apple"

print("Ürün ID          : \(urun_id)")
print("Ürün Adı         : \(urun_adi)")
print("Ürün Adeti       : \(urun_adet)")
print("Ürün Fiyatı      : \(urun_fiyat) ₺")
print("Ürün Tedarikçisi : \(urun_tedarikci)")


// Constant - Sabitler (Let)
var sayi = 10
print(sayi)
sayi = 20
print(sayi)

let numara = 10
print(sayi)
// numara = 20 // Hata verir.
// print(sayi)


// Tür Dönüşümü - Type Casting
// Sayısaldan - Sayısala
var i = 42
var d = 56.78

var sonuc1 = Double(i)
var sonuc2 = Int(d) // Direkt noktadan sonraki kısmı siler. Yuvarlama yapmaz.

print(sonuc1)
print(sonuc2)

// Sayısaldan - Metine
var sonuc3 = String(i) // "42"
var sonuc4 = String(d) // "56.78"
print(sonuc3)
print(sonuc4)

// Metinden - Sayısala
// Direkt dönüştürülürse Optional veya nil döner. If let yapısı kullanmak zorunlu.
var yazi1 = "34"
var sonuc5 = Int(yazi1)
let sonuc6 = Int(yazi1)
print(sonuc5)
print(sonuc6)

var yazi2 = "34.5"
var sonuc7 = Int(yazi2)
let sonuc8 = Int(yazi2)
print(sonuc7)
print(sonuc8)

if let sonuc9 = Int(yazi1) {
    print(sonuc9)
}

if let sonuc10 = Int(yazi2) {
    print(sonuc10) // 34.5 Int'e dönüşemeyeceği için hata oluşacağı için if false oluyor çalışmıyor. Print yazdırmaz yani.
}

if let sonuc11 = Int(yazi2) {
    print(sonuc11)
} else {
    print("Dönüşüm hatası")
}
