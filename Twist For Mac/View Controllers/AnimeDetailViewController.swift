//
//  AnimeDetailViewController.swift
//  Twist For Mac
//
//  Created by Aritro Paul on 12/07/20.
//  Copyright © 2020 Aritro Paul. All rights reserved.
//

import UIKit
import AVKit

class AnimeDetailViewController: UIViewController {

    var anime = AnimeDetail()
    @IBOutlet weak var banner: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var poster: UIImageView!
    @IBOutlet weak var episodesTableView: UITableView!
    
    var episodes = [Episode]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        banner.kf.setImage(with: URL(string: anime.nejireExtension?.coverImage ?? ""))
        poster.kf.setImage(with: URL(string: anime.nejireExtension?.posterImage ?? ""))
        titleLabel.text = anime.title
        descriptionLabel.text = anime.animeDetailDescription
        
        episodesTableView.delegate = self
        episodesTableView.dataSource = self
        
        loadEpisodes()
    }
    
    func loadEpisodes() {
        AnimeManager.shared.loadEpisodes(anime: anime) { (result) in
            switch result {
            case .success(let episodes):
                self.episodes = episodes
                DispatchQueue.main.async {
                    self.episodesTableView.reloadData()
                }
            case .failure(let error):
                print(error)
            }
        }
    }
    
    @IBAction func backTapped(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func watchingTapped(_ sender: Any) {
    }
}

extension AnimeDetailViewController : UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return episodes.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "episodeCell")!
        cell.textLabel?.text = "Episode \(episodes[indexPath.row].number ?? 0)"
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let episode = episodes[indexPath.row]
        guard let url = URL(string: episode.decodedURL().addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) ?? "") else { return }
        let headerFields: [String:String] = ["Referer":"https://twist.moe/a/\(anime.slug?.slug ?? "")/\(episodes[indexPath.row].number ?? 0)"]
        let asset: AVURLAsset = AVURLAsset(url: url, options: ["AVURLAssetHTTPHeaderFieldsKey": headerFields])
        let playerItem = AVPlayerItem(asset: asset)
        let player = AVPlayer(playerItem: playerItem)
        let playerViewController = AVPlayerViewController()
        playerViewController.player = player
        playerViewController.player?.play()
        self.present(playerViewController, animated: true)
    }
    
}
