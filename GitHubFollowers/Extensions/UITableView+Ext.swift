//
//  UITableView+Ext.swift
//  GitHubFollowers
//
//  Created by roman on 25.10.2024.
//

import UIKit

extension UITableView {
    
    func reloadDataOnMainThread() {
        DispatchQueue.main.async {
            self.reloadData()
        }
    }
     
    func removeExcessCell() {
        tableFooterView = UIView(frame: .zero)
    }
}
