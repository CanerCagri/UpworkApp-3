//
//  TrendsViewController.swift
//  UpworkApp-3
//
//  Created by Caner Çağrı on 14.10.2022.
//

import UIKit

class TrendsViewController: UIViewController {
    
    let pasteLabel: UILabel = {
        var label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .white
        label.textAlignment = .center
        label.text = "Top Tiktok Songs This Week"
        label.font = UIFont.systemFont(ofSize: 30, weight: .bold)
        label.adjustsFontForContentSizeCategory = true
        label.adjustsFontSizeToFitWidth = true
        label.minimumScaleFactor = 0.7
        return label
    }()
    
    let pasteLabel2: UILabel = {
        var label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .white
        label.textAlignment = .center
        label.text = "last updated: 30/09/2022, 4:31:02"
        label.font = UIFont.systemFont(ofSize: 15, weight: .medium)
        label.adjustsFontForContentSizeCategory = true
        label.adjustsFontSizeToFitWidth = true
        label.minimumScaleFactor = 0.7
        return label
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        configureViewController()
        setupUI()
    }
    
    func configureViewController() {
        view.backgroundColor = .systemBrown
        title = "SavingTok"
    }
    
    func setupUI() {
        view.addSubview(pasteLabel)
        pasteLabel.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(20)
            make.trailing.equalToSuperview().offset(-20)
            make.centerX.equalToSuperview()
            make.top.equalTo(150)
        }
        
        view.addSubview(pasteLabel2)
        pasteLabel2.snp.makeConstraints { make in
            make.top.equalTo(pasteLabel.snp.bottom)
            make.leading.equalToSuperview().offset(5)
            make.trailing.equalToSuperview().offset(-5)
        }
    }
}
