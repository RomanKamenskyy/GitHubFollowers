//
//  UIViewController+Ext.swift
//  GitHubFollowers
//
//  Created by roman on 27.09.2024.
//

import UIKit
import SafariServices



extension UIViewController {
    func presentGHAlertOnMainThread (title: String, message: String, buttonTitle: String){
        DispatchQueue.main.async {
            let alertVC = GHAlertVC(alertTitle: title, message: message, buttonTitle: buttonTitle)
            alertVC.modalPresentationStyle = .overFullScreen
            alertVC.modalTransitionStyle = .crossDissolve
            self.present(alertVC, animated: true)
        }
    }
    
    func presentSafariVC(with url: URL) {
        let safariVC = SFSafariViewController(url: url)
        safariVC.preferredBarTintColor = .systemGreen
        present(safariVC, animated: true)
    }
    
    
}
