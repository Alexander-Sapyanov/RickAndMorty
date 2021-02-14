//
//  InfoViewController.swift
//  RickAndMorty
//
//  Created by Alexander  Sapianov on 14.02.2021.
//

import UIKit

class InfoViewController: UIViewController {

    
    let tapLabel: UILabel = {
        let label = UILabel()
        label.text = "Tap on portal"
        label.font = UIFont(name: "Helvetica", size: 50)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    var portalButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .clear
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(UIImage(named: "portal"), for: .normal)
        
        return button
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setThings()
        portalButton.addTarget(self, action: #selector(press), for: .touchDown)
    
        view.backgroundColor = .white
    }
    
   func setThings(){
    
    view.addSubview(tapLabel)
    view.addSubview(portalButton)
    NSLayoutConstraint.activate([
        tapLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 70),
        tapLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
        tapLabel.heightAnchor.constraint(equalToConstant: 50),
        
        portalButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
        portalButton.centerYAnchor.constraint(equalTo: view.centerYAnchor),
        portalButton.widthAnchor.constraint(equalToConstant: 450),
        portalButton.heightAnchor.constraint(equalToConstant: 450)
    ])
    
    
    }
    
    @objc func press() {
        
        let timeInterval: CFTimeInterval = 3
        let rotateAnimation = CABasicAnimation(keyPath: "transform.rotation")
        rotateAnimation.fromValue = 0.0
        rotateAnimation.toValue = CGFloat(Double.pi * 2)
        rotateAnimation.isRemovedOnCompletion = false
        rotateAnimation.duration = timeInterval
        rotateAnimation.repeatCount = 1
        portalButton.layer.add(rotateAnimation, forKey: nil)

}
}
