//
//  Utils.swift
//  Twist For Mac
//
//  Created by Aritro Paul on 11/07/20.
//  Copyright © 2020 Aritro Paul. All rights reserved.
//

import Foundation

struct Twist {
    
    struct Anime {
        static let base = "https://twist.suzuha.moe/"
        static let anime = base + "anime/"
        static let sources = "/sources/"
        static let trending = base + "list/trending/anime?limit="
        static let motd = base + "motd/"
        static let airing = base + "list/anime?page[limit]=20&sort=-user_count&filter[status]=current&page[offset]="
        static let rated = base + "list/anime?page[limit]=20&sort=-average_rating&page[offset]="
        static let cdn = "https://twist.moe"
    }
    
    struct Constant {
        static let key = "LXgIVP&PorO68Rq7dTx8N^lP!Fa5sGJ^*XK"
    }
}
