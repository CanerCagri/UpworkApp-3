//
//  SettingsCell.swift
//  UpworkApp-3
//
//  Created by Caner Çağrı on 25.10.2022.
//

import UIKit

class SettingsCell: UITableViewCell {
    
    static let reuseID = "Cell"
    
    let rowimageView: UIImageView = {
        var image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.layer.cornerRadius = 10
        image.clipsToBounds = true
        return image
    }()
    
    let nameLabel: UILabel = {
        var label = UILabel()
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 17, weight: .bold)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .white
        label.adjustsFontSizeToFitWidth = true
        label.minimumScaleFactor = 0.9
        label.lineBreakMode = .byTruncatingTail
        return label
    }()
    
    let padding: CGFloat = 12
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func set(data: Model) {
        rowimageView.image = UIImage(systemName: data.image)
        nameLabel.text = data.name
    }
    
    private func configure() {
        addSubviews(rowimageView, nameLabel)
        accessoryType = .disclosureIndicator
        
        NSLayoutConstraint.activate([
            rowimageView.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            rowimageView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: padding),
            rowimageView.heightAnchor.constraint(equalToConstant: 25),
            rowimageView.widthAnchor.constraint(equalToConstant: 25),
            
            nameLabel.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            nameLabel.leadingAnchor.constraint(equalTo: rowimageView.trailingAnchor, constant: 24),
            nameLabel.heightAnchor.constraint(equalToConstant: 30)
        ])
    }
}
