//
//  DefaultTitleLabel.swift
//  GithubRepos
//
//  Created by eslam mohamed on 10/04/2022.
//

import UIKit

class DefaultTitleLabel: UILabel {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureTitleLabel()
    }
    
    required init?(coder: NSCoder) { fatalError("init(coder:) has not been implemented") }
    
    init(textAlignment: NSTextAlignment, fontSize: CGFloat, fontColor: UIColor) {
        super.init(frame: .zero)
        self.textAlignment = textAlignment
        self.font          = UIFont(name: "Almarai-Bold", size: fontSize)
        self.textColor     = fontColor
        configureTitleLabel()
    }
    
    private func configureTitleLabel(){
        adjustsFontSizeToFitWidth  = true
        minimumScaleFactor         = 0.9
        lineBreakMode              = .byTruncatingTail
        translatesAutoresizingMaskIntoConstraints = false
    }
    
    
    
}
