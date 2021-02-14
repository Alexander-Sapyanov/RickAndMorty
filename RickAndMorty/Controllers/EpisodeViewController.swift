//
//  EpisodeViewController.swift
//  RickAndMorty
//
//  Created by Alexander  Sapianov on 14.02.2021.
//

import UIKit

class EpisodeViewController: UIViewController {

    var episodeTableView: UITableView!
    
    var episodes: [EpisodeResults] = []
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUpTableView()
        fetchEpisodes()
    }
    
    func setUpTableView() {
        episodeTableView = UITableView()
        view.addSubview(episodeTableView)
        NSLayoutConstraint.activate([
            episodeTableView.topAnchor.constraint(equalTo: view.topAnchor),
            episodeTableView.leftAnchor.constraint(equalTo: view.leftAnchor),
            episodeTableView.rightAnchor.constraint(equalTo: view.rightAnchor),
            episodeTableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
            
        ])
        episodeTableView.translatesAutoresizingMaskIntoConstraints = false
    
        episodeTableView.dataSource = self
        episodeTableView.delegate = self
        episodeTableView.register(EpisodesTableViewCell.self, forCellReuseIdentifier: EpisodesTableViewCell.identifier)
        
    }
    
    func fetchEpisodes() {
        let url = URL(string: "https://rickandmortyapi.com/api/episode")!
        
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            guard let data = data else {return}
            
            DispatchQueue.main.async {
                
                do {
                    let jsonResult = try JSONDecoder().decode(EpisodeModel.self, from: data)
                    self.episodes = jsonResult.results
                    print(self.episodes)
                    self.episodeTableView.reloadData()
                }
                catch {
                    print("something went wrong")
                }
                
            }
        }.resume()
    }
}

extension EpisodeViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return episodes.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: EpisodesTableViewCell.identifier, for: indexPath) as! EpisodesTableViewCell
        cell.backgroundColor = .red
        cell.episodeName.text = episodes[indexPath.row].name
        return cell
    }
}

extension EpisodeViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200
    }
}

