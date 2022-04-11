//
//  Date+Ext.swift
//  GithubRepos
//
//  Created by eslam mohamed on 11/04/2022.
//

import Foundation

extension Date{
    
    func convertDateToString() -> String{
        let dateFormatter        = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssX"
        return dateFormatter.string(from: self)
    }
}
