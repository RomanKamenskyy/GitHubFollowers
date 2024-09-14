//
//  SearchVC.swift
//  GitHubFollowers
//
//  Created by roman on 11.09.2024.
//

import UIKit

class SearchVC: UIViewController {
    
    let logoGHImageView = UIImageView()
    let usernametextField = GHTextField()
    let actionButton = GHButton(backgroundColor: .systemGreen, title: "Get followers")
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .systemBackground
        configureLogoImage()
        configureTextField()
        configureActionButton()
        createDismissKeyboardTypeGesture()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.isNavigationBarHidden = true
    }
    
    func createDismissKeyboardTypeGesture() {
        let tap = UITapGestureRecognizer(target: self.view, action: #selector(UIView.endEditing))
        view.addGestureRecognizer(tap)
    }
   
    func configureLogoImage() {
        view.addSubview(logoGHImageView)
        logoGHImageView.translatesAutoresizingMaskIntoConstraints = false
        
        logoGHImageView.image = UIImage(named: "gh-logo")
        
        NSLayoutConstraint.activate([
            logoGHImageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 200),
            logoGHImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            logoGHImageView.widthAnchor.constraint(equalToConstant: 200),
            logoGHImageView.heightAnchor.constraint(equalToConstant: 200)
        ])
    }
    
    func configureTextField() {
        view.addSubview(usernametextField)
        
        NSLayoutConstraint.activate([
            usernametextField.topAnchor.constraint(equalTo: logoGHImageView.bottomAnchor, constant: 48),
            usernametextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 50),
            usernametextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -50),
            usernametextField.heightAnchor.constraint(equalToConstant: 50)
            
        ])
    }
    
    func configureActionButton() {
        view.addSubview(actionButton)
        
        NSLayoutConstraint.activate([
            actionButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -50),
            actionButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 50),
            actionButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -50),
            actionButton.heightAnchor.constraint(equalToConstant: 50)
        ])
    }

}
