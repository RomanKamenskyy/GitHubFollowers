//
//  FollowersListVC.swift
//  GitHubFollowers
//
//  Created by roman on 16.09.2024.
//

import UIKit

class FollowersListVC: UIViewController {
    
    var username: String!
    var collectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureCollectionView()
        configureViewController()
        getFollowers()
      
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        navigationController?.setNavigationBarHidden(false, animated: true)
    }
    
    func configureCollectionView () {
        collectionView = UICollectionView(frame: view.bounds, collectionViewLayout: createThreeColomnFlowLayout())
        view.addSubview(collectionView)
        collectionView.backgroundColor = .systemPink
        collectionView.register(FollowerCell.self, forCellWithReuseIdentifier: FollowerCell.reuseID)
    }
    func configureViewController() {
        view.backgroundColor = .systemBackground
        navigationController?.navigationBar.prefersLargeTitles = true
    }
    
    func createThreeColomnFlowLayout() -> UICollectionViewFlowLayout {
        let width = view.bounds.width
        let padding: CGFloat = 12
        let minimumItemSpacing: CGFloat = 10
        let availibleWidth = width - (padding * 2) - (minimumItemSpacing * 2)
        let itemWidth = availibleWidth / 3
        
        let flowlayout = UICollectionViewFlowLayout()
        flowlayout.sectionInset = UIEdgeInsets(top: padding, left: padding, bottom: padding, right: padding)
        flowlayout.itemSize = CGSize(width: itemWidth, height: itemWidth + 40)
        return flowlayout
        
    } 
    func getFollowers() {
        NetworkManager.shared.getFollowers(for: username, page: 1) { result in
            switch result {
            case .success(let followers):
                print("Followers count is \(followers.count)")
                print(followers)
            case .failure(let error):
                self.presentGHAlertOnMainThread(title: "Bad stuff happens", message: error.rawValue, buttonTitle: "OK")
                
            }
        }
    }
    
}
