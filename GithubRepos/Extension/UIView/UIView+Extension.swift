//
//  UIView+Extension.swift
//  GithubRepos
//
//  Created by eslam mohamed on 10/04/2022.
//

import UIKit

extension UIView{
    
    func addBorder(color: UIColor){
        layer.borderWidth = 1
        layer.borderColor = color.cgColor
    }

}
