//
//  ViewController.swift
//  P22_BildirimCalismasi
//
//  Created by Ali Osman Öztürk on 14.09.2025.
//

import UIKit
import UserNotifications

class ViewController: UIViewController {
    
    var izinKontrol = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        UNUserNotificationCenter.current().delegate = self
        
        UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .badge, .sound], completionHandler: { granted, error in
            
            self.izinKontrol = granted
            
            if granted {
                print("İzin alma işlemi başarılı.")
            } else {
                print("İzin alma işlemi başarısız.")
            }
            
        }
        )
    }

    @IBAction func buttonBildirimOlustur(_ sender: Any) {
        if izinKontrol {
            let icerik = UNMutableNotificationContent()
            icerik.title = "Başlık"
            icerik.subtitle = "Alt Başlık"
            icerik.body = "Bu bir bildirimdir."
            icerik.badge = 1
            icerik.sound = UNNotificationSound.default
            
            let tetikleme = UNTimeIntervalNotificationTrigger(timeInterval: 10, repeats: false)
            // let tetikleme = UNTimeIntervalNotificationTrigger(timeInterval: 60, repeats: true) // En erken 60 saniyede bir tekrarlanabilir bildirim yapabiliyoruz.
            
            let bildirimIstek = UNNotificationRequest(identifier: "id", content: icerik, trigger: tetikleme)
            
            UNUserNotificationCenter.current().add(bildirimIstek)
        }
    }
    
}

extension ViewController: UNUserNotificationCenterDelegate {
    func userNotificationCenter(_ center: UNUserNotificationCenter, willPresent notification: UNNotification, withCompletionHandler completionHandler: @escaping (UNNotificationPresentationOptions) -> Void) {
        completionHandler([.banner, .badge, .sound])
    }
    
    func userNotificationCenter(_ center: UNUserNotificationCenter, didReceive response: UNNotificationResponse, withCompletionHandler completionHandler: @escaping () -> Void) {
        let app = UIApplication.shared
        app.applicationIconBadgeNumber = 0
        
        print("Bildirim seçildi.")
        
        if app.applicationState == .active {
            print("Önplan: Bildirim seçildi.")
        }
        
        if app.applicationState == .inactive {
            print("Arkaplan: Bildirim seçildi.")
        }
    
        completionHandler()
    }
}
