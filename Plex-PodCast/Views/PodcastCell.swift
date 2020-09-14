//
//  PodcastCell.swift
//  Plex-PodCast
//
//  Created by RD on 9/14/20.
//  Copyright © 2020 Reggie Daniels. All rights reserved.
//

import UIKit

class PodcastCell: UITableViewCell {

    @IBOutlet weak var podcastImageView: UIImageView!
    
    @IBOutlet weak var trackNameLabel: UILabel!
    
    @IBOutlet weak var artistNameLabel: UILabel!
    
    @IBOutlet weak var episodeCountLabel: UILabel!
    
    var podcast: Podcast!
    
}
