//
//  ViewController.swift
//  RickAndMorty
//
//  Created by Alexander  Sapianov on 07.02.2021.
//

import UIKit
import SDWebImage

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var tableView: UITableView!
    var datas: CharacterModel?
    var characters: [Character] = []
    
    
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        createTableView()
        fetchCharacters()
        
    }
    
    // MARK: - Functions
    func createTableView() {
        tableView = UITableView()
        tableView.frame = view.frame
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(MainTableViewCell.self, forCellReuseIdentifier: MainTableViewCell.identifier)
        view.addSubview(tableView)
        
    }
    
    func fetchCharacters() {
        let url = URL(string: "https://rickandmortyapi.com/api/character")!
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            
            
            guard let data = data else {return}
            DispatchQueue.main.async {
                do {
                    let jsonResult = try JSONDecoder().decode(CharacterModel.self, from: data)
                    
                    self.datas = jsonResult
                    self.characters = jsonResult.results
                    self.tableView.reloadData()
                }
                catch {
                    print("somethig went wrong")
                }
            }
        }.resume()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return characters.count
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: MainTableViewCell.identifier, for: indexPath) as! MainTableViewCell
        cell.nameLabel.text = characters[indexPath.row].name
        cell.locationLabel.text = characters[indexPath.row].location.name
        let url = URL(string: characters[indexPath.row].image)
        cell.someImage.sd_setImage(with: url,placeholderImage: UIImage(named: "1"),options: [.continueInBackground,.progressiveLoad],completed: nil)

        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200
    }
}

