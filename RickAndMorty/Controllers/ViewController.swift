//
//  ViewController.swift
//  RickAndMorty
//
//  Created by Alexander  Sapianov on 07.02.2021.
//

import UIKit
import SDWebImage

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    
    let client = Client()
    var tableView: UITableView!
    var datas: CharacterModel?
    var characterInfo: CharacterInfo!
    var currentPageCharacter = 1
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
        client.character().fetchCharacters(byPageNumber: currentPageCharacter) { [unowned self] (result) in
            switch result.self {
            case .success(let characters):
                DispatchQueue.main.async {
                    self.characterInfo = characters.info
                    self.characters.append(contentsOf: characters.results)
                    self.currentPageCharacter += 1
                    self.tableView.reloadData()
                }
            case .failure(let error):
                print(error)
            }
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return characters.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == characters.count - 1 && currentPageCharacter <= characterInfo.pages {
            let cell = tableView.dequeueReusableCell(withIdentifier: MainTableViewCell.identifier, for: indexPath) as! MainTableViewCell
            self.fetchCharacters()
            return cell
        }
        
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

