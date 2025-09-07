//
//  PageYViewController.swift
//  Odev04_Navigation
//
//  Created by Ali Osman Öztürk on 7.09.2025.
//

import UIKit

class PageYViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func buttonGoBack(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
    
    @IBAction func buttonGoRoot(_ sender: Any) {
        navigationController?.popToRootViewController(animated: true)
    }
}
