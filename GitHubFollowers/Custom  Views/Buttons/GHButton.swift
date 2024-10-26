//
//  GHButton.swift
//  GitHubFollowers
//
//  Created by roman on 11.09.2024.
//

import UIKit

class GHButton: UIButton {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    convenience init(backgroundColor: UIColor, title: String) {
        self.init(frame: .zero)
        set(color: backgroundColor, title: title)
    }
    
    private func configure() {
        configuration = .tinted()
        configuration?.cornerStyle = .medium
        translatesAutoresizingMaskIntoConstraints = false
    }
    
    func set(color: UIColor, title: String){
        configuration?.baseBackgroundColor = color
        configuration?.baseForegroundColor = color 
        self.backgroundColor = backgroundColor
        self.setTitle(title, for: .normal)
    }
}
