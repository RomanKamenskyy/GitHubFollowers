//
//  GHFollowerItemVC.swift
//  GitHubFollowers
//
//  Created by roman on 20.10.2024.
//

import UIKit

class GHFollowerItemVC: GHItemInfoVC {
    override func viewDidLoad() {
        super.viewDidLoad()
        configureItems()
    }
    
    private func configureItems() {
        itemInfoOne.set(itemInfoType: .followers, withCount: user.followers)
        itemInfoTwo.set(itemInfoType: .followers, withCount: user.following)
        actionButton.set(backgroundColor: .systemGreen , title: "Get followers")
        
    }
    
    override func actionButtonTapped() {
        delegate.didTappedFollowers(for: user)
    }
    
    
}
