//
//  AnimeDetail.swift
//  Twist For Mac
//
//  Created by Aritro Paul on 11/07/20.
//  Copyright © 2020 Aritro Paul. All rights reserved.
//

import Foundation

struct AnimeDetail: Codable {
    var id: Int?
    var title, altTitle, animeDetailDescription: String?
    var episodes: [Slug]?
    var season, ongoing, hbID, hidden: Int?
    var malID: Int?
    var createdAt: String?
    var updatedAt: String?
    var slug: Slug?
    var nejireExtension: NejireExtension?

    enum CodingKeys: String, CodingKey {
        case id, title
        case altTitle = "alt_title"
        case animeDetailDescription = "description"
        case episodes, season, ongoing
        case hbID = "hb_id"
        case hidden
        case malID = "mal_id"
        case createdAt = "created_at"
        case updatedAt = "updated_at"
        case slug
        case nejireExtension = "nejire_extension"
    }
}
