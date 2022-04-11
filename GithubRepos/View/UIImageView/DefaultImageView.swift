//
//  DefaultImageView.swift
//  GithubRepos
//
//  Created by eslam mohamed on 10/04/2022.
//

import UIKit

class DefaultImageView: UIImageView {

    let avaterPlaceHolder = "avatar-placeholder"

    override init(frame: CGRect) {
        super.init(frame: frame)
        configureImg()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configureImg(){
        clipsToBounds      = true
        image              = UIImage(named: avaterPlaceHolder)
        translatesAutoresizingMaskIntoConstraints = false
    }

}
