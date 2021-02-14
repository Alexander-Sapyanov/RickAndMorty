//
//  MainTableViewCell.swift
//  RickAndMorty
//
//  Created by Alexander  Sapianov on 12.02.2021.
//

import UIKit

class MainTableViewCell: UITableViewCell {
    static let identifier = "MainTableViewCell"
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        addViews()
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    var someImage: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "1")
        image.translatesAutoresizingMaskIntoConstraints = false
        image.layer.cornerRadius = 50
        image.clipsToBounds = true
       return image
    }()
    
    var nameLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "Helvetica", size: 20)
        label.textAlignment = .left
        label.translatesAutoresizingMaskIntoConstraints = false
        label.backgroundColor = .clear
        label.textColor = .blue
        return label
    }()
    
    let planetLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "Helvetica", size: 15)
        label.textAlignment = .right
        label.text = "Planet - "
        label.translatesAutoresizingMaskIntoConstraints = false
        label.backgroundColor = .clear
        label.textColor = .black
        return label
    }()

    var locationLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "Helvetica", size: 18)
        label.textAlignment = .left
        label.textColor = .lightGray
        label.backgroundColor = .clear
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    func addViews(){
        addSubview(someImage)
        addSubview(nameLabel)
        addSubview(planetLabel)
        addSubview(locationLabel)
        
        
        someImage.leftAnchor.constraint(equalTo: leftAnchor, constant: 5).isActive = true
        someImage.widthAnchor.constraint(equalToConstant: 100).isActive = true
        someImage.heightAnchor.constraint(equalToConstant: 100).isActive = true
        someImage.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        
        nameLabel.topAnchor.constraint(equalTo: topAnchor, constant: 15).isActive = true
        nameLabel.leftAnchor.constraint(equalTo: someImage.rightAnchor, constant: 15).isActive = true
        nameLabel.widthAnchor.constraint(equalTo: nameLabel.widthAnchor).isActive = true
        nameLabel.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        
        planetLabel.leftAnchor.constraint(equalTo: leftAnchor, constant: 15).isActive = true
        planetLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -5).isActive = true
        planetLabel.widthAnchor.constraint(equalTo: planetLabel.widthAnchor).isActive = true
        planetLabel.heightAnchor.constraint(equalToConstant:20).isActive = true
        
        locationLabel.leftAnchor.constraint(equalTo: planetLabel.rightAnchor, constant: 2).isActive = true
        locationLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -5).isActive = true
        locationLabel.widthAnchor.constraint(equalTo: locationLabel.widthAnchor).isActive = true
        locationLabel.heightAnchor.constraint(equalToConstant: 20).isActive = true
    }
}
