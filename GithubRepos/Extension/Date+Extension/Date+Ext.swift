//
//  Date+Ext.swift
//  GithubRepos
//
//  Created by eslam mohamed on 11/04/2022.
//

import Foundation

protocol IDate{
    func convertDateToString() -> String
}

extension Date:IDate{
    
    func convertDateToString() -> String{
        let dateFormatter        = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        return dateFormatter.string(from: self)
    }
}
