//
//  SettingsViewController.swift
//  UpworkApp-3
//
//  Created by Caner Çağrı on 14.10.2022.
//

import UIKit

class SettingsViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        configureViewController()
    }
    
    func configureViewController() {
        view.backgroundColor = .systemBrown
        title = "Settings"
    }
}
