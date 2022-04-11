//
//  Constant.swift
//  GithubRepos
//
//  Created by eslam mohamed on 10/04/2022.
//

import Foundation

enum State{
    case loading
    case error
    case empty
    case finished
}


class URLs {
    private static var baseUrl = "https://api.github.com"
    
    static func repos() -> String {
        return baseUrl + "/search/repositories?q=created:%3E2017-10-22&sort=stars&order=desc&page="
    }
}
