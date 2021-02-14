//
//  EpisodesTableViewCell.swift
//  RickAndMorty
//
//  Created by Alexander  Sapianov on 14.02.2021.
//

import UIKit

class EpisodesTableViewCell: UITableViewCell {

    static let identifier = "EpisodesTableViewCell"
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        addViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    var episodeName: UILabel = {
        let label = UILabel()
        label.textColor = .red
        label.backgroundColor = .black
        label.textAlignment = .left
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    func addViews(){
        addSubview(episodeName)
        
        NSLayoutConstraint.activate([
            episodeName.leftAnchor.constraint(equalTo: leftAnchor, constant: 5),
            episodeName.topAnchor.constraint(equalTo: topAnchor, constant: 5),
            episodeName.widthAnchor.constraint(equalTo: episodeName.widthAnchor),
            episodeName.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -5)
        ])
        
    }
    
}
