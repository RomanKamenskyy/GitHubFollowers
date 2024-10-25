//
//  GHDataLoadingView.swift
//  GitHubFollowers
//
//  Created by roman on 25.10.2024.
//

import UIKit

class GHDataLoadingView: UIViewController {

    fileprivate var containerView: UIView!
    
    func showLoadingView() {
        containerView = UIView(frame: view.bounds)
        view.addSubview(containerView)
        
        view.backgroundColor = .systemBackground
        containerView.alpha = 0
        
        UIView.animate(withDuration: 0.25) {
            self.containerView.alpha = 0.9
        }
        let activityIndicator = UIActivityIndicatorView(style: .large)
        containerView.addSubview(activityIndicator)
        activityIndicator.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            activityIndicator.centerYAnchor.constraint(equalTo: containerView.centerYAnchor),
            activityIndicator.centerXAnchor.constraint(equalTo: containerView.centerXAnchor)
        ])
        
        activityIndicator.startAnimating()
        
    }
    func dismissLoadingView() {
        DispatchQueue.main.async {
            self.containerView.removeFromSuperview()
            self.containerView = nil
        }
    }
    
    
    
    func showEmptySateView(with message: String, in view: UIView) {
        let emptyStateView = GHEmptyState(message: message)
        emptyStateView.frame = view.bounds
        view.addSubview(emptyStateView)
        
    } 
}
