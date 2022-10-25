//
//  SettingsViewController.swift
//  UpworkApp-3
//
//  Created by Caner Çağrı on 14.10.2022.
//

import UIKit

class SettingsViewController: UIViewController {
    
    let scrollView = UIScrollView()
    let contentView = UIView()
    
    var subscriptionContainer = UIView()
    var shareContainer = UIView()
    var supportContainer = UIView()
    var legalContainer = UIView()
    
    var containers: [UIView] = []
    
    let padding: CGFloat = 20
    let spaceBetweenContainers: CGFloat = 20
    

    override func viewDidLoad() {
        super.viewDidLoad()
        configureViewController()
        configureScrollView()
        layoutUI()
        configureUI()
    }
    
    func configureViewController() {
        view.backgroundColor = .systemGray
        title = "Settings"
    }
    
    func configureScrollView() {
        view.addSubviews(scrollView)
        scrollView.addSubviews(contentView)
        
        scrollView.pinToEdges(view: view)
        contentView.pinToEdges(view: scrollView)
        
        contentView.widthAnchor.constraint(equalTo: scrollView.widthAnchor).isActive = true
        contentView.heightAnchor.constraint(equalToConstant: 600).isActive = true
    }
    
    func add(childVC: UIViewController, containerView: UIView) {
        addChild(childVC)
        containerView.addSubview(childVC.view)
        childVC.view.frame = containerView.bounds
    }
    
    func configureUI() {
        self.add(childVC: STSubscriptionVc(), containerView: self.subscriptionContainer)
        self.add(childVC: STShareVc(), containerView: self.shareContainer)
        self.add(childVC: STSupportVc(), containerView: self.supportContainer)
        self.add(childVC: STLegalVc(), containerView: self.legalContainer)
    }
    
    func layoutUI() {
        containers = [subscriptionContainer, shareContainer, supportContainer, legalContainer]
        
        for containerView in containers {
            view.addSubview(containerView)
            containerView.translatesAutoresizingMaskIntoConstraints = false
        }
        
        subscriptionContainer.snp.makeConstraints { make in
            make.top.equalTo(contentView)
            make.leading.equalTo(contentView).offset(padding)
            make.trailing.equalTo(contentView).offset(-padding)
            make.height.equalTo(120)
        }
        
        shareContainer.snp.makeConstraints { make in
            make.top.equalTo(subscriptionContainer.snp.bottom).offset(spaceBetweenContainers)
            make.leading.equalTo(contentView).offset(padding)
            make.trailing.equalTo(contentView).offset(-padding)
            make.height.equalTo(180)
        }
        
        supportContainer.snp.makeConstraints { make in
            
            make.top.equalTo(shareContainer.snp.bottom).offset(spaceBetweenContainers - 20)
            make.leading.equalTo(contentView).offset(padding)
            make.trailing.equalTo(contentView).offset(-padding)
            make.height.equalTo(60)
        }
        
        legalContainer.snp.makeConstraints { make in
            make.top.equalTo(supportContainer.snp.bottom).offset(spaceBetweenContainers + 20)
            make.leading.equalTo(contentView).offset(padding)
            make.trailing.equalTo(contentView).offset(-padding)
            make.height.equalTo(120)
        }
    }
}
