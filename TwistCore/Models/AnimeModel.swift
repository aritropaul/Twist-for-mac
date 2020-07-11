//
//  AnimeModel.swift
//  Twist For Mac
//
//  Created by Aritro Paul on 11/07/20.
//  Copyright © 2020 Aritro Paul. All rights reserved.
//

import Foundation

struct Anime: Codable {
    var id: Int?
    var title, altTitle: String?
    var season, ongoing, hbID: Int?
    var createdAt, updatedAt: String?
    var hidden, malID: Int?
    var slug: Slug?
    var nejireExtension: NejireExtension?

    enum CodingKeys: String, CodingKey {
        case id, title
        case altTitle = "alt_title"
        case season, ongoing
        case hbID = "hb_id"
        case createdAt = "created_at"
        case updatedAt = "updated_at"
        case hidden
        case malID = "mal_id"
        case slug
        case nejireExtension = "nejire_extension"
    }
}

// MARK: - NejireExtension
struct NejireExtension: Codable {
    var posterImage, coverImage: String?

    enum CodingKeys: String, CodingKey {
        case posterImage = "poster_image"
        case coverImage = "cover_image"
    }
}

// MARK: - Slug
struct Slug: Codable {
    var id: Int?
    var slug: String?
    var animeID: Int?
    var createdAt, updatedAt: String?

    enum CodingKeys: String, CodingKey {
        case id, slug
        case animeID = "anime_id"
        case createdAt = "created_at"
        case updatedAt = "updated_at"
    }
}
