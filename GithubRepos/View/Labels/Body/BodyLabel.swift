//
//  BodyLabel.swift
//  GithubRepos
//
//  Created by eslam mohamed on 10/04/2022.
//

import UIKit

class BodyLabel: UILabel {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureBodyLabel()
    }
    
    required init?(coder: NSCoder) { fatalError("init(coder:) has not been implemented") }
    
    init(textAlignment: NSTextAlignment, fontSize: CGFloat, fontColor: UIColor) {
        super.init(frame: .zero)
        self.font          = UIFont(name: "Almarai-Light", size: fontSize)
        self.textColor     = fontColor
        self.textAlignment = textAlignment
        configureBodyLabel()
    }
    
    private func configureBodyLabel(){
        adjustsFontSizeToFitWidth = true
        minimumScaleFactor        = 0.90
        lineBreakMode             = .byTruncatingTail
        translatesAutoresizingMaskIntoConstraints = false
    }
    
}
