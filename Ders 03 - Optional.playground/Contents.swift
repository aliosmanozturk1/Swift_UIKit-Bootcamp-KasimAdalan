import UIKit

// Optional = Nullable = Null Safety

var mesaj = "Hello World"  // Normal tanımlama
var str: String?           // Nil yani null

if str != nil {
    print(str)
} else {
    print("str nil değer içeriyor.")
}

str = "Merhaba"

if str != nil {
    print(str)
} else {
    print("str nil değer içeriyor.")
}

if str != nil {
    print(str!) // Unwrap
} else {
    print("str nil değer içeriyor.")
}


// Optional Binding
if let temp = str {
    print(temp) // Otomatik unwrap
} else {
    print("str nil değer içeriyor.")
}

if var temp = str {
    print(temp) // Otomatik unwrap
    temp = "Nasılsın"
    print(temp)
} else {
    print("str nil değer içeriyor.")
}
