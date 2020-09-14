//
//  APIService.swift
//  Plex-PodCast
//
//  Created by RD on 9/9/20.
//  Copyright © 2020 Reggie Daniels. All rights reserved.
//

import Foundation
import Alamofire


class APIService {
    
    let baseiTunesSearchURL = "https://itunes.apple.com/search"
    
    //singleton
    static let shared = APIService()
    
    func fetchPodcasts(searchText: String, completionHandler: @escaping ([Podcast]) -> ()) {
        print("Searching for podcasts...")
        
              let parameters = ["term": searchText, "media": "podcast"]
              
              AF.request(baseiTunesSearchURL, method: .get, parameters: parameters, encoding: URLEncoding.default, headers: nil).responseData { (dataResponse) in
                       
                  if let err = dataResponse.error {
                             print("failed to contact itunes", err)
                             return
                         }
                         guard let data = dataResponse.data else { return}
                       
                         do {
                             
                              let searchResult = try JSONDecoder().decode(SearchResults.self, from: data)
                            completionHandler(searchResult.results)
                             
                         } catch let decodeErr {
                             
                             print("Failed to decode:", decodeErr)
                         }
                         
              }
    }
    struct SearchResults: Decodable {
           let resultCount: Int
           let results: [Podcast]
       }
}
