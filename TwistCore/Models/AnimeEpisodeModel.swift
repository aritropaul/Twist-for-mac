//
//  AnimeEpisode.swift
//  Twist For Mac
//
//  Created by Aritro Paul on 11/07/20.
//  Copyright © 2020 Aritro Paul. All rights reserved.
//

import Foundation

struct Episode: Codable {
    var id: Int?
    var source: String?
    var number, animeID: Int?
    var createdAt, updatedAt: String?

    enum CodingKeys: String, CodingKey {
        case id, source, number
        case animeID = "anime_id"
        case createdAt = "created_at"
        case updatedAt = "updated_at"
    }
    
    func decodedURL() -> String {
        return Twist.Anime.cdn + CryptoJS.AES.shared.decrypt(self.source ?? "", password: Twist.Constant.key)
    }
    
}
