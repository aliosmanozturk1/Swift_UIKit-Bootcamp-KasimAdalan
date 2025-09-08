//
//  ViewController.swift
//  Odev05_HesapMakinesi
//
//  Created by Ali Osman Öztürk on 8.09.2025.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var islem: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        islem.text = "İşlem: "
    }

    // MARK: İşlem Butonları
    @IBAction func buttonCalculate(_ sender: Any) {
        // label’daki metni al
        var expr = islem.text ?? ""
        
        // "İşlem: " kısmını at
        expr = expr.replacingOccurrences(of: "İşlem:", with: "")
        
        // çarpma ve bölmeyi doğru sembole çevir
        expr = expr.replacingOccurrences(of: "x", with: "*")
        expr = expr.replacingOccurrences(of: "X", with: "*")
        
        // virgülü noktaya çevir (hesap için)
        expr = expr.replacingOccurrences(of: ",", with: ".")
        
        // boşlukları sil
        expr = expr.replacingOccurrences(of: " ", with: "")
        
        // Sadece bölme işleminden önce sayıları double'a zorla
        expr = expr.replacingOccurrences(of: "/", with: ".0/")
        expr = expr.replacingOccurrences(of: ".0.0/", with: ".0/") 
        
        // ifadeyi hesapla
        let expression = NSExpression(format: expr)
        if let result = expression.expressionValue(with: nil, context: nil) as? NSNumber {
            islem.text = "İşlem: \(result)"
        } else {
            islem.text = "Geçersiz işlem"
        }
    }

    
    @IBAction func buttonClear(_ sender: Any) {
        islem.text = "İşlem: "
    }
    
    // MARK: Tuş Takımı
    @IBAction func button1(_ sender: Any) {
        islem.text! += "1"
        
    }
    
    
    @IBAction func button2(_ sender: Any) {
        islem.text! += "2"
        
    }
    
    
    @IBAction func button3(_ sender: Any) {
        islem.text! += "3"
        
    }
    
    
    @IBAction func button4(_ sender: Any) {
        islem.text! += "4"
        
    }
    
    
    @IBAction func button5(_ sender: Any) {
        islem.text! += "5"
        
    }
    
    
    @IBAction func button6(_ sender: Any) {
        islem.text! += "6"
    }
    
    
    @IBAction func button7(_ sender: Any) {
        islem.text! += "7"
    }
    
    
    @IBAction func button8(_ sender: Any) {
        islem.text! += "8"
    }
    
    @IBAction func button9(_ sender: Any) {
        islem.text! += "9"
    }
    
    @IBAction func button0(_ sender: Any) {
        islem.text! += "0"
    }
    
    @IBAction func buttonComma(_ sender: Any) {
        islem.text! += ","
    }
    
    @IBAction func buttonPlus(_ sender: Any) {
        islem.text! += " + "
    }
    
    @IBAction func buttonMinus(_ sender: Any) {
        islem.text! += " - "
    }
    
    
    @IBAction func buttonMultiplication(_ sender: Any) {
        islem.text! += " X "
    }
    
    
    @IBAction func buttonDivide(_ sender: Any) {
        islem.text! += " / "
    }
}

