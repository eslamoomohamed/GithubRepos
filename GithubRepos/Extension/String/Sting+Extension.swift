//
//  Sting+Extension.swift
//  GithubRepos
//
//  Created by eslam mohamed on 11/04/2022.
//

import Foundation

protocol IStrings{
    func convertToDate() -> Date?
    func convertDateToDisplay() -> String
}

extension String:IStrings{
    
    func convertToDate() -> Date? {
        let dateFormatter         = DateFormatter()
        dateFormatter.dateFormat  = "yyyy-MM-dd'T'HH:mm:ssZ"
        dateFormatter.locale      = Locale(identifier: "en_US_POSIX")
        dateFormatter.timeZone    = .current
        return dateFormatter.date(from: self)
    }
    
    func convertDateToDisplay() -> String{
        guard let date = self.convertToDate() else {return "N/A"}
        return date.convertDateToString()
    }
    
    
    
    
    
}
