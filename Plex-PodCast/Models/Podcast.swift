//
//  Podcast.swift
//  Plex-PodCast
//
//  Created by RD on 9/7/20.
//  Copyright © 2020 Reggie Daniels. All rights reserved.
//

import Foundation

struct Podcast: Decodable {
    var trackName: String?
    var artistName: String?
    var artworkUrl60: String?
    var trackCount: Int?
    var feedUrl: String?
}


