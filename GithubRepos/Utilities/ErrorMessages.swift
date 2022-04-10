//
//  ErrorMessages.swift
//  GithubRepos
//
//  Created by eslam mohamed on 10/04/2022.
//

import Foundation

enum ErrorMessages: String,Error{
    
    case noInternet                   = "No Internet Please Check Your Connection"
    case invalidUrl                   = "invalid URL, Please try again later"
    case invalidResponse              = "Invalid response from the server, Please try again later"
    case invalidData                  = "The data recived from the server is invalid"
    case invalidDataAfterDecoding     = "Invalid after decoding"
}
