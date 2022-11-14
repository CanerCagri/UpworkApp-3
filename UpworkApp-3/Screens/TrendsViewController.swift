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
    
    var tableView = UITableView()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        configureViewController()
        setupUI()
        configureTableView()
    }
    
    private func configureViewController() {
        view.backgroundColor = .systemBrown
        title = "SavingTok"
    }
    
    private func configureTableView() {
        tableView.backgroundColor = .systemBrown
        tableView.rowHeight = 80
        tableView.tableFooterView = UIView(frame: .zero)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(SongsCell.self, forCellReuseIdentifier: SongsCell.reuseID)
    }
    
    private func setupUI() {
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
        
        view.addSubview(tableView)
        tableView.snp.makeConstraints { make in
            make.top.equalTo(pasteLabel2.snp.bottom).offset(20)
            make.leading.equalToSuperview().offset(30)
            make.trailing.equalToSuperview().offset(-10)
            make.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottom)
        }
    }
}

extension TrendsViewController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return SongData.data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: SongsCell.reuseID) as! SongsCell
        let data = SongData.data[indexPath.section]
        cell.backgroundColor = .systemGray2
        cell.layer.cornerRadius = 50
        cell.set(data: data)
        cell.isUserInteractionEnabled = false
        return cell
    }
    

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        let cellSpacingHeight: CGFloat = 0.7
        return cellSpacingHeight
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = UIView()
        headerView.backgroundColor = UIColor.systemGray
        headerView.layer.isHidden = true
        return headerView
    }
}
