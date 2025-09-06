import UIKit

// Karşılaştırma Operatörleri

var a = 10
var b = 20

var x = 90
var y = 80

print("a == b : \(a == b)")
print("a != b : \(a != b)")
print("a > b : \(a > b)")
print("a >= b : \(a >= b)")
print("a < b : \(a < b)")
print("a <= b : \(a <= b)")

print("a > b || x > y : \(a > b || x > y)") // OR (VEYA), false - false: false, diğer durumlar true
print("a > b && x > y : \(a > b && x > y)") // AND (VE), true - true: true, diğer durumlar false

// MARK: If
var yas = 19
var isim = "Mehmet"

if yas >= 18 {
    print("Reşitsiniz")
} else {
    print("Reşit değilsiniz")
}

if isim == "Ahmet" {
    print("Merhaba Ahmet")
} else if isim == "Mehmet" {
    print("Merhaba Mehmet")
} else {
    print("Tanınmayan Kişi")
}

var user = "admin"
var pass = 123456

if user == "admin" && pass == 123456 {
    print("Hoşgeldiniz")
} else {
    print("Bilgileriniz yanlış")
}

var sonuc = 9

if sonuc == 9 || sonuc == 10 {
    print("Sonuç 9 veya 10'dur")
} else {
    print("Sonuç 9 veya 10 değildir.")
}


// MARK: Switch
var gun = 3

switch gun {
    case 1: print("Pazartesi")
    case 2: print("Salı")
    case 3: print("Çarşamba")
    case 4: print("Perşembe")
    case 5: print("Cuma")
    case 6: print("Cumartesi")
    case 7: print("Pazar")
    default: print("Böyle bir gün yok")
}


// MARK: For Döngüsü
for x in 1...3 { // 1 er 1 er artar.
    print("x Döngü değeri: \(x)")
}

for a in stride(from: 10, through: 20, by: 5) { // 5 er 5 er artar.
    print("a Döngü değeri: \(a)")
}

for b in stride(from: 20, through: 10, by: -5) { // 5 er 5 er azalır.
    print("b Döngü değeri: \(b)")
}


// While Döngüsü
var sayac = 1

while sayac < 4 {
    print("Sayaç Döngü : \(sayac)")
    sayac += 1 // sayac = sayac + 1
}

// Break
for i in 1...5 {
    if i == 3 {
        break
    }
    print("i Döngü: \(i)")
}

// Continue
for j in 1...5 {
    if j == 3 {
        continue
    }
    print("j Döngü: \(j)")
}
