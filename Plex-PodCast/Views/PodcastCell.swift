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
    
    var podcast: Podcast! {
        didSet {
            trackNameLabel.text = podcast.trackName
            artistNameLabel.text = podcast.artistName
            
            
            episodeCountLabel.text = "\(podcast.trackCount ?? 0) Episodes" //loading track count
            
            print("Image is loading", podcast.artworkUrl60 ?? "")
            
            guard let url = URL(string: podcast.artworkUrl60 ?? "") else {
                return
            }
            URLSession.shared.dataTask(with: url) { (data, _, _) in
                print("finished downloading image data", data!)
                
                guard let data = data else {return}
                
                DispatchQueue.main.async {
                     self.podcastImageView.image = UIImage(data: data)
                }
                
               
                
            }.resume()
        }
    }
    
}
