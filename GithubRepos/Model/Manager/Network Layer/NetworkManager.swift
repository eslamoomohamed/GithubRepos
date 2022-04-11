//
//  NetworkManager.swift
//  GithubRepos
//
//  Created by eslam mohamed on 10/04/2022.
//

import UIKit

protocol INetworkManager{
    func fetchDataFromApi<B:Codable>(urlString: String,page: Int,baseModel: B.Type ,completion: @escaping (Result<B,ErrorMessages>)->Void )
}

class NetworkManager:INetworkManager{
    
    static let shared = NetworkManager()
    let cache         = NSCache<NSString, UIImage>()
    private init(){}
    
    func fetchDataFromApi<B>(urlString: String,page: Int ,baseModel: B.Type, completion: @escaping (Result<B, ErrorMessages>) -> Void) where B : Decodable, B : Encodable {
        let endpoint = urlString + "\(page)"
        print(endpoint)
        guard let url = URL(string: endpoint) else{
            completion(.failure(.invalidUrl))
            return
        }
        let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
            if let _ = error {
                completion(.failure(.noInternet))
                return
            }
            guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
                completion(.failure(.invalidResponse))
                return
            }
            guard let data = data else {
                completion(.failure(.invalidData))
                return
            }
            do{
                let decoder = JSONDecoder()
                decoder.keyDecodingStrategy = .useDefaultKeys
                let resultData = try decoder.decode(B.self, from: data)
                completion(.success(resultData))
            }catch{
                print(error.localizedDescription)
                completion(.failure(.invalidDataAfterDecoding))
            }
        }
        task.resume()
    }
    
    
    
    
}
