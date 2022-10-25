//
//  STShareVc.swift
//  UpworkApp-3
//
//  Created by Caner Çağrı on 25.10.2022.
//

import UIKit

class STSupportVc: UIViewController {
    
    var tableView = UITableView()
    
    var rowData: [Model] = [Model(image: "message.fill", name: "Contact Us"), ]

    var headerLabel: UILabel = {
        var label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .green
        label.text = "Support"
        
        label.font = UIFont.systemFont(ofSize: 17, weight: .bold)
        return label
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
        configureTableView()
    }
    
    private func configureTableView() {
        tableView.backgroundColor = .clear
        tableView.rowHeight = 30
        tableView.tableFooterView = UIView(frame: .zero)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(SettingsCell.self, forCellReuseIdentifier: SettingsCell.reuseID)
    }
    
    private func configureUI() {
        view.addSubview(headerLabel)
        headerLabel.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.leading.equalToSuperview()
        }
        
        view.addSubview(tableView)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.snp.makeConstraints { make in
            make.top.equalTo(headerLabel.snp.bottom).offset(15)
            make.leading.equalToSuperview()
            make.trailing.equalToSuperview()
            make.bottom.equalToSuperview()
        }
    }
}

extension STSupportVc: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return rowData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: SettingsCell.reuseID) as! SettingsCell
        let data = rowData[indexPath.row]
        cell.set(data: data)
        return cell
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        cell.backgroundColor = tableView.backgroundColor
        cell.contentView.backgroundColor = tableView.backgroundColor
    }
}

