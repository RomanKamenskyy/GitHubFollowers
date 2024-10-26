//
//  UIViewController+Ext.swift
//  GitHubFollowers
//
//  Created by roman on 27.09.2024.
//

import UIKit
import SafariServices



extension UIViewController {
    
    func presentGHAlert (title: String, message: String, buttonTitle: String){
        let alertVC = GHAlertVC(alertTitle: title, message: message, buttonTitle: buttonTitle)
        alertVC.modalPresentationStyle = .overFullScreen
        alertVC.modalTransitionStyle = .crossDissolve
        present(alertVC, animated: true)
    }
    
    func presentDefaultError (){
        let alertVC = GHAlertVC(alertTitle: "Something went wrong",
                                message: "We were unable to complete your task. Please try again later.",
                                buttonTitle: "Ok")
        alertVC.modalPresentationStyle = .overFullScreen
        alertVC.modalTransitionStyle = .crossDissolve
        present(alertVC, animated: true)
    }
    
    func presentSafariVC(with url: URL) {
        let safariVC = SFSafariViewController(url: url)
        safariVC.preferredBarTintColor = .systemGreen
        present(safariVC, animated: true)
    }
    
    
}
