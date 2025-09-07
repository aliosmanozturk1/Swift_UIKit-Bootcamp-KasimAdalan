//
//  PageAViewController.swift
//  Odev04_Navigation
//
//  Created by Ali Osman Öztürk on 7.09.2025.
//

import UIKit

class PageAViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func buttonGoB(_ sender: Any) {
        performSegue(withIdentifier: "pageB", sender: nil)
    }
    
}
