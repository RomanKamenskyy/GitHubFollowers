//
//  UIHelper.swift
//  GitHubFollowers
//
//  Created by roman on 12.10.2024.
//


import UIKit

enum UIHelper {
    static func createThreeColomnFlowLayout(in view: UIView) -> UICollectionViewFlowLayout {
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
}
