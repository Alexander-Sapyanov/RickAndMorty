//
//  EpisodeViewController.swift
//  RickAndMorty
//
//  Created by Alexander  Sapianov on 14.02.2021.
//

import UIKit

class EpisodeViewController: UIViewController {

    let client = Client()
    var episodeTableView: UITableView!
    var episodes: [EpisodeResults] = []
    var currentPageCharacter = 1
    private var infoEpisodes: EpisodeInfo!
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpTableView()
        fetchEpisodes()
    }
    
    // MARK: - Functions
    func fetchEpisodes() {
        client.episode().fetchEpisodes(byPageNumber: currentPageCharacter) { [unowned self] (result) in
            switch result.self {
            case .success(let episodes):
                DispatchQueue.main.async {
                    self .infoEpisodes = episodes.info
                    self.episodes.append(contentsOf: episodes.results)
                    print(self.episodes.count)
                    self.currentPageCharacter += 1
                    self.episodeTableView.reloadData()
                }
            case .failure(let error):
                print(error)
            }
        }
    }
    func setUpTableView() {
        episodeTableView = UITableView()
        view.addSubview(episodeTableView)
        episodeTableView.dataSource = self
        episodeTableView.delegate = self
        episodeTableView.register(EpisodesTableViewCell.self, forCellReuseIdentifier: EpisodesTableViewCell.identifier)
        episodeTableView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            episodeTableView.topAnchor.constraint(equalTo: view.topAnchor),
            episodeTableView.leftAnchor.constraint(equalTo: view.leftAnchor),
            episodeTableView.rightAnchor.constraint(equalTo: view.rightAnchor),
            episodeTableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
            
        ])
    }
}

// MARK: - Extensions
extension EpisodeViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return episodes.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        if indexPath.row == episodes.count - 1 && currentPageCharacter <= infoEpisodes.pages {
            let cell = tableView.dequeueReusableCell(withIdentifier: EpisodesTableViewCell.identifier, for: indexPath)
            self.fetchEpisodes()
            return cell
        }
        
        let cell = tableView.dequeueReusableCell(withIdentifier: EpisodesTableViewCell.identifier, for: indexPath) as! EpisodesTableViewCell
        cell.episodeName.text = episodes[indexPath.row].name
        cell.episodeNumber.text = episodes[indexPath.row].episode
        cell.prepareForReuse()
        return cell
    }
}

extension EpisodeViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 75
    }
}

