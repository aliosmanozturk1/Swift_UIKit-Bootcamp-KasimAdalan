//
//  ViewController.swift
//  Odev04_Navigation
//
//  Created by Ali Osman Öztürk on 7.09.2025.
//

import UIKit

class RootViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func buttonGoA(_ sender: Any) {
        performSegue(withIdentifier: "pageA", sender: nil)
    }
    
    @IBAction func buttonGoX(_ sender: Any) {
        performSegue(withIdentifier: "pageX", sender: nil)
    }
}

