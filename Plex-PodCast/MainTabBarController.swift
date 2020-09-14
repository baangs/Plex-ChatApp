//
//  MainTabBarController.swift
//  Plex-PodCast
//
//  Created by RD on 9/7/20.
//  Copyright © 2020 Reggie Daniels. All rights reserved.
//Creating tab bar items/ boiler plate code

import UIKit

class MainTabBarContoller: UITabBarController {
    override func viewDidLoad() {
    super.viewDidLoad()
        
        UINavigationBar.appearance().prefersLargeTitles = true
        
        tabBar.tintColor = .black
   
        setUpViewControllers()
    }
    
    //MARK:- Setup Functions
    
    func setUpViewControllers() {
        
        let image1 = UIImage(named:"favorites")
        let image2 = UIImage(named:"downloads")
        let image3 = UIImage(named:"search")
        
        viewControllers = [
            
            generateNavigationContoller(for: PodcastsSearchController(), title: "Search", image: image3!),
            generateNavigationContoller(for: ViewController(), title: "Favorites", image: image1!),
            generateNavigationContoller(for: ViewController(), title: "Downloads", image: image2!)
        ]
    }
    
    //MARK:- Helper Functions
    
    fileprivate func generateNavigationContoller(for rootViewController: UIViewController, title: String, image: UIImage) -> UIViewController {
        let navController = UINavigationController(rootViewController: rootViewController)
        rootViewController.navigationItem.title = title
              navController.tabBarItem.title = title
              navController.tabBarItem.image = image
            return navController
    }
}
