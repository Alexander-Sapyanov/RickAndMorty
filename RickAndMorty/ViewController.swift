//
//  ViewController.swift
//  RickAndMorty
//
//  Created by Alexander  Sapianov on 07.02.2021.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
  
    
    
    var tableView: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()

        
     
        createTableView()
        createNavigationBar()

       
        
    }
    
    func createTableView() {
        
        tableView = UITableView()
        tableView.frame = view.frame
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        view.addSubview(tableView)
        
        
    }
    
    func createNavigationBar() {
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.title = "Rick and Morty"
        
        
    }
    
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.backgroundColor = .red
        return cell
    }
    
    
}
