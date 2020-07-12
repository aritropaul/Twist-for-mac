//
//  AnimeManager.swift
//  Twist For Mac
//
//  Created by Aritro Paul on 11/07/20.
//  Copyright © 2020 Aritro Paul. All rights reserved.
//

import Foundation

class AnimeManager {
    static let shared = AnimeManager()
    
    func loadAllAnime(completion: @escaping(Result<[Anime], Error>)->Void) {
        guard let url = URL(string: Twist.Anime.anime) else { return }
        let session = URLSession.shared
        let task = session.dataTask(with: url) { (data, response, error) in
            if let data = data {
                let anime = try! JSONDecoder().decode([Anime].self, from: data)
                completion(.success(anime))
            }
            else {
                completion(.failure(error!))
            }
        }
        task.resume()
    }
    
    func loadAnime(anime: Anime, completion: @escaping(Result<AnimeDetail, Error>)->Void) {
        guard let slug = anime.slug?.slug else { return }
        guard let url = URL(string: Twist.Anime.anime + slug) else { return }
        let session = URLSession.shared
        let task = session.dataTask(with: url) { (data, response, error) in
            if let data = data {
                let anime = try! JSONDecoder().decode(AnimeDetail.self, from: data)
                completion(.success(anime))
            }
            else {
                completion(.failure(error!))
            }
        }
        task.resume()
    }
    
    func loadEpisodes(anime: AnimeDetail, completion: @escaping(Result<[Episode], Error>)->Void) {
        guard let slug = anime.slug?.slug else { return }
        guard let url = URL(string: Twist.Anime.anime + slug + Twist.Anime.sources) else { return }
        let session = URLSession.shared
        let task = session.dataTask(with: url) { (data, response, error) in
            if let data = data {
                let episodes = try! JSONDecoder().decode([Episode].self, from: data)
                completion(.success(episodes))
            }
            else {
                completion(.failure(error!))
            }
        }
        task.resume()
    }
 
    func loadFilteredAnime(filter: Menu, limit: String? = nil, offset: String? = nil, completion: @escaping(Result<[Anime], Error>)->Void) {
        let url : URL!
        switch filter {
            case .trending : url = URL(string: Twist.Anime.trending+(limit ?? "20"))
            case .airing : url = URL(string: Twist.Anime.airing+(offset ?? "0"))
            case .rated : url = URL(string: Twist.Anime.rated+(offset ?? "0"))
            case .all: url = URL(string: Twist.Anime.anime)
        }
        let session = URLSession.shared
        let task = session.dataTask(with: url) { (data, response, error) in
            if let data = data {
                let anime = try! JSONDecoder().decode([Anime].self, from: data)
                completion(.success(anime))
            }
            else {
                completion(.failure(error!))
            }
        }
        task.resume()
    }
    
}
