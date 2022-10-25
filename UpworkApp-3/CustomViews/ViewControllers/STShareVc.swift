//
//  STShareVc.swift
//  UpworkApp-3
//
//  Created by Caner Çağrı on 25.10.2022.
//

import UIKit

class STShareVc: UIViewController {
    
    var tableView = UITableView()
    
    var rowData: [Model] = [Model(image: "heart.fill", name: "Write a Review"),
                            Model(image: "arrowshape.turn.up.right.fill", name: "Share App"),
                            Model(image: "ellipsis", name: "More Apps")
    ]
    
    var headerLabel: UILabel = {
        var label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .green
        label.text = "Share"
        
        label.font = UIFont.systemFont(ofSize: 17, weight: .bold)
        return label
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
        configureTableView()
    }
    
    private func configureTableView() {
        tableView.separatorStyle = UITableViewCell.SeparatorStyle.singleLine
        tableView.separatorColor = UIColor.white
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

extension STShareVc: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return rowData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: SettingsCell.reuseID) as! SettingsCell
        let data = rowData[indexPath.row]
        cell.set(data: data)
        cell.selectionStyle = .none
        return cell
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        cell.backgroundColor = tableView.backgroundColor
        cell.contentView.backgroundColor = tableView.backgroundColor
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let data = rowData[indexPath.row]
        let warning = UIAlertController(title: "\(data.name) clicked", message: "", preferredStyle: .alert)
        warning.addAction(UIAlertAction(title: "OK", style: .cancel))
        present(warning, animated: true)
    }
}

