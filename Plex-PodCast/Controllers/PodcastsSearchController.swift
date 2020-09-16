//
//  PodcastsSearchController.swift
//  Plex-PodCast
//
//  Created by RD on 9/7/20.
//  Copyright © 2020 Reggie Daniels. All rights reserved.
//

import UIKit
import Alamofire

class PodcastsSearchController: UITableViewController, UISearchBarDelegate {
    
    var podcasts = [Podcast]()
    
    let cellId = "cellId"
    
    //implement a search bar/searchController
    
    let searchController = UISearchController(searchResultsController: nil)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
       setupSearchBar()
       setUpTableView()
    }
    
    //MARK:- Setup Work
    //1.register a cell for our tableview
    fileprivate func setUpTableView(){
       // tableView.register(UITableViewCell.self, forCellReuseIdentifier: cellId)
        
        let nib = UINib(nibName: "PodcastCell", bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: cellId)
    }
    
    fileprivate func setupSearchBar() {
        navigationItem.searchController = searchController
        searchController.searchBar.delegate = self
        navigationItem.hidesSearchBarWhenScrolling = false
     
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        
        APIService.shared.fetchPodcasts(searchText: searchText) { (podcasts) in
            
            self.podcasts = podcasts
            self.tableView.reloadData()
        }
    }
    
    
    
    //MARK:- UITableView
    //2.return number of rows
    override func tableView(_ tableview: UITableView, numberOfRowsInSection section: Int) -> Int {
        return podcasts.count
    }
    
    //3.dequeue cell
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath) as! PodcastCell
        
        let podcast = self.podcasts[indexPath.row]
        cell.podcast = podcast
        
     
//        let image4 = UIImage(named:"appicon")
//        let podcast = self.podcasts[indexPath.row]
//        cell.textLabel?.text = "\(podcast.trackName ?? "")\n\(podcast.artistName ?? "")"
//        cell.textLabel?.numberOfLines = -1
//        cell.imageView?.image = image4
//
        return cell
        
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 132
    }
}
