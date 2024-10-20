//
//  GHRepoItemVC.swift
//  GitHubFollowers
//
//  Created by roman on 20.10.2024.
//

import UIKit

class GHRepoItemVC: GHItemInfoVC {
    override func viewDidLoad() {
        super.viewDidLoad()
        configureItems()
    }
    
    private func configureItems() {
        itemInfoOne.set(itemInfoType: .repos, withCount: user.publicRepos)
        itemInfoTwo.set(itemInfoType: .gists, withCount: user.publicGists)
        actionButton.set(backgroundColor: .systemPurple, title: "GitHub profile")
        
    }
}
