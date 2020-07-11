//
//  AnimeViewController.swift
//  Twist For Mac
//
//  Created by Aritro Paul on 11/07/20.
//  Copyright © 2020 Aritro Paul. All rights reserved.
//

import UIKit
import Kingfisher

private let reuseIdentifier = "animeCell"

class AnimeViewController: UICollectionViewController {
    
    var anime = [Anime]()
    var page = 1
    var currentFilter : Menu = .all

    override func viewDidLoad() {
        super.viewDidLoad()

        loadAnime(option: .all)
        
    }
    
    func loadAnime(option : Menu) {
        switch option {
        case .all : loadAllAnime()
        case .trending : loadTrendingAnime()
        case .rated : loadTopRatedAnime()
        case .airing : loadTopAiringAnime()
        }
        
    }
    
    
    func loadAllAnime() {
        self.navigationItem.title = "All Anime"
        AnimeManager.shared.loadAllAnime { (result) in
            switch result {
            case .success(let anime) :
                self.anime = anime
                DispatchQueue.main.async {
                    self.collectionView.reloadData()
                }
            case .failure(let error) :
                print(error)
            }
        }
    }
    
    func loadTrendingAnime(limit: Int = 50) {
        self.navigationItem.title = "Trending Anime"
        currentFilter = .trending
        AnimeManager.shared.loadFilteredAnime(filter: .trending, limit: String(limit)) { (result) in
            switch result {
            case .success(let anime) :
                self.anime = anime
                DispatchQueue.main.async {
                    self.collectionView.reloadData()
                }
            case .failure(let error) :
                print(error)
            }
        }
    }
    
    func loadTopRatedAnime(page: Int = 1) {
        self.navigationItem.title = "Top Rated Anime"
        currentFilter = .rated
        let offset = String((page - 1)*20)
        AnimeManager.shared.loadFilteredAnime(filter: .rated, offset: offset) { (result) in
            switch result {
            case .success(let anime) :
                if self.page == 1 {
                    self.anime = anime
                }
                else {
                    self.anime += anime
                }
                DispatchQueue.main.async {
                    self.collectionView.reloadData()
                }
            case .failure(let error) :
                print(error)
            }
        }
    }
    
    func loadTopAiringAnime() {
        self.navigationItem.title = "Top Airing Anime"
        currentFilter = .airing
        let offset = String((page - 1)*20)
        AnimeManager.shared.loadFilteredAnime(filter: .airing, offset: offset) { (result) in
            switch result {
            case .success(let anime) :
                if self.page == 1 {
                    self.anime = anime
                }
                else {
                    self.anime += anime
                }
                DispatchQueue.main.async {
                    self.collectionView.reloadData()
                }
            case .failure(let error) :
                print(error)
            }
        }
    }
    

    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }


    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return anime.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! AnimeCollectionViewCell
        cell.title.text = anime[indexPath.item].title
        cell.posterImage.kf.setImage(with: URL(string: anime[indexPath.item].nejireExtension?.posterImage ?? ""))
        cell.posterImage.contentMode = .scaleAspectFill
        if indexPath.item == anime.count - 5 {
            page = page + 1
            print(page)
            loadAnime(option: currentFilter)
        }
        return cell
    }


}
