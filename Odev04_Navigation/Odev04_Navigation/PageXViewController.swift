//
//  PageXViewController.swift
//  Odev04_Navigation
//
//  Created by Ali Osman Öztürk on 7.09.2025.
//

import UIKit

class PageXViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func buttonGoY(_ sender: Any) {
        performSegue(withIdentifier: "pageXtoPageY", sender: nil)
    }
    
}
