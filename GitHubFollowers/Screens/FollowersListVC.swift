//
//  FollowersListVC.swift
//  GitHubFollowers
//
//  Created by roman on 16.09.2024.
//

import UIKit

class FollowersListVC: UIViewController {
    
    var username: String! = nil

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .systemBackground
        navigationController?.isNavigationBarHidden = false
        navigationController?.navigationBar.prefersLargeTitles = true
    }
    
}
