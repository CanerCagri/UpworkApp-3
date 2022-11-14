//
//  SongsCell.swift
//  UpworkApp-3
//
//  Created by Caner Çağrı on 14.11.2022.
//

import UIKit

class SongsCell: UITableViewCell {

    static let reuseID = "SongsCell"
    
    let rowimageView: UIImageView = {
        var image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.layer.cornerRadius = 40
        image.clipsToBounds = true
        return image
    }()
    
    let nameLabel: UILabel = {
        var label = UILabel()
        label.numberOfLines = 0
        label.textAlignment = .left
        label.font = UIFont.systemFont(ofSize: 15, weight: .bold)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .white
        label.adjustsFontSizeToFitWidth = true
        label.minimumScaleFactor = 0.9
        return label
    }()
    
    let viewsLabel: UILabel = {
        var label = UILabel()
        label.textAlignment = .left
        label.font = UIFont.systemFont(ofSize: 10, weight: .bold)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .white
        label.adjustsFontSizeToFitWidth = true
        return label
    }()

    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func set(data: SongModel) {
        rowimageView.image = UIImage(named: data.image)
        nameLabel.text = data.name
        viewsLabel.text = data.view
    }
    
    private func configure() {
        addSubviews(rowimageView, nameLabel, viewsLabel)
        
        NSLayoutConstraint.activate([
            rowimageView.topAnchor.constraint(equalTo: self.topAnchor, constant: 5),
            rowimageView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 5),
            rowimageView.heightAnchor.constraint(equalToConstant: 70),
            rowimageView.widthAnchor.constraint(equalToConstant: 70),
            
            nameLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 15),
            nameLabel.leadingAnchor.constraint(equalTo: rowimageView.trailingAnchor, constant: 10),
            nameLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20),
            nameLabel.heightAnchor.constraint(equalToConstant: 40),
            
            viewsLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor),
            viewsLabel.leadingAnchor.constraint(equalTo: rowimageView.trailingAnchor, constant: 10),
            viewsLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20),
            viewsLabel.heightAnchor.constraint(equalToConstant: 20),
        ])
    }
}
