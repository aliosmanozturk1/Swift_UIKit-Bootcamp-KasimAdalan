//
//  ViewController.swift
//  P01_TasarimCalismasi
//
//  Created by Ali Osman Öztürk on 7.09.2025.
//

import UIKit

class ViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.

        self.navigationItem.title = "Pizza"

        let appearance = UINavigationBarAppearance()
        appearance.backgroundColor = UIColor(named: "mainColor")
        appearance.titleTextAttributes = [
            .foregroundColor: UIColor(named: "textColor1")!,
            .font: UIFont(name: "Pacifico-Regular", size: 20)!
        ]

        navigationController?.navigationBar.standardAppearance = appearance
        navigationController?.navigationBar.compactAppearance = appearance
        navigationController?.navigationBar.scrollEdgeAppearance = appearance

        navigationController?.navigationBar.barStyle = .black
    }
}
