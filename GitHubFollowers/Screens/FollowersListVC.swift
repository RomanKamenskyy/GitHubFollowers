//
//  FollowersListVC.swift
//  GitHubFollowers
//
//  Created by roman on 16.09.2024.
//

import UIKit

class FollowersListVC: UIViewController {
    
    
    enum Section {
        case main
    }
    
    var username: String!
    var followers: [Follower] = []
    var collectionView: UICollectionView!
    var dataSource: UICollectionViewDiffableDataSource<Section, Follower>!
    var page = 1
    var hasMoreFollowers = true
    override func viewDidLoad() {
        super.viewDidLoad()
        configureCollectionView()
        configureViewController()
        getFollowers(username: username, page: page)
        configureDataSource()
      
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        navigationController?.setNavigationBarHidden(false, animated: true)
    }
    
   
    
    
    func configureCollectionView () {
        collectionView = UICollectionView(frame: view.bounds, collectionViewLayout: UIHelper.createThreeColomnFlowLayout(in: view))
        view.addSubview(collectionView)
        collectionView.delegate = self
        collectionView.backgroundColor = .systemBackground
        collectionView.register(FollowerCell.self, forCellWithReuseIdentifier: FollowerCell.reuseID)
    }
    func configureViewController() {
        view.backgroundColor = .systemBackground
        navigationController?.navigationBar.prefersLargeTitles = true
    }
    
   
    func getFollowers(username: String, page: Int) {
        
        showLoadingView()
        NetworkManager.shared.getFollowers(for: username, page: page) {[weak self] result in
             #warning("call dismiss")
            guard let self = self else { return }
            
            switch result {
            case .success(let followers):
                if followers.count < 100 { self.hasMoreFollowers = false }
                self.followers.append(contentsOf: followers)
                self.updataData()
//                print("Followers count is \(followers.count)")
//                print(followers)
            case .failure(let error):
                self.presentGHAlertOnMainThread(title: "Bad stuff happens", message: error.rawValue, buttonTitle: "OK")
                
            }
        }
    }
    
    func configureDataSource() {
        dataSource = UICollectionViewDiffableDataSource(collectionView: collectionView, cellProvider: { collectionView, indexPath, itemIdentifier in
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: FollowerCell.reuseID, for: indexPath) as! FollowerCell
            cell.set(follower: itemIdentifier)
            return cell
        })
    }
    
    func updataData() {
        var snapshot = NSDiffableDataSourceSnapshot<Section, Follower>()
        snapshot.appendSections([.main])
        snapshot.appendItems(followers)
        DispatchQueue.main.async {
            self.dataSource.apply(snapshot, animatingDifferences: true)
        }
        
    }
}


extension FollowersListVC: UICollectionViewDelegate {
    
    func scrollViewDidEndDragging(_ scrollView: UIScrollView, willDecelerate decelerate: Bool) {
        let offsetY = scrollView.contentOffset.y
        let contentHeigt = scrollView.contentSize.height
        let height = scrollView.frame.size.height
 
//        print(offsetY)
//        print(contentHeigt)
//        print(height)
        if offsetY > contentHeigt - height {
            guard hasMoreFollowers else { return }
            page += 1
            getFollowers(username: username, page: page)
        }
    }
}
