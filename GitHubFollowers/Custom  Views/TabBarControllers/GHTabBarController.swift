//
//  GHTabBarController.swift
//  GitHubFollowers
//
//  Created by roman on 23.10.2024.
//

import UIKit

class GHTabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        UITabBar.appearance().tintColor = .systemGreen
        viewControllers = [createSearchNavigationController(), createFavoriteNavigationController()]
    }
    
    func createSearchNavigationController() -> UINavigationController {
        let searchVC = SearchVC()
        searchVC.title = "Search"
        searchVC.tabBarItem = UITabBarItem(tabBarSystemItem: .search, tag: 0)
        
        return UINavigationController(rootViewController: searchVC)
    }
    
    func createFavoriteNavigationController() -> UINavigationController {
        let favoriteVC = FavoriteVC()
        favoriteVC.title = "Favorites"
        favoriteVC.tabBarItem = UITabBarItem(tabBarSystemItem: .favorites, tag: 1)
        
        return UINavigationController(rootViewController: favoriteVC)
    }
    
    func createTabBar() -> UITabBarController {
        let tabbar = UITabBarController()
        return tabbar
    }
}
