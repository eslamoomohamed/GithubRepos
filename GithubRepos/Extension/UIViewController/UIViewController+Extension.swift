//
//  UIViewController+Extension.swift
//  GithubRepos
//
//  Created by eslam mohamed on 11/04/2022.
//

import UIKit

fileprivate var containerView: DefaultView!

extension UIViewController{
    
    func showLoadingView(){
        containerView = DefaultView(color: .darkGray, raduis: 15)
        view.addSubview(containerView)
        containerView.alpha     = 0
        UIView.animate(withDuration: 0.25) {containerView.alpha = 0.4}
        let activityIndecator   = UIActivityIndicatorView(style: .large)
        containerView.addSubview(activityIndecator)
        activityIndecator.color = .black
        activityIndecator.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            containerView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            containerView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            containerView.heightAnchor.constraint(equalToConstant: 100),
            containerView.widthAnchor.constraint(equalToConstant: 100),
            
            activityIndecator.centerXAnchor.constraint(equalTo: containerView.centerXAnchor),
            activityIndecator.centerYAnchor.constraint(equalTo: containerView.centerYAnchor)
        ])
        activityIndecator.startAnimating()
    }
    
    func removeLoadingView(){
        DispatchQueue.main.async {
            containerView.removeFromSuperview()
            containerView = nil
        }
    }
    
}
