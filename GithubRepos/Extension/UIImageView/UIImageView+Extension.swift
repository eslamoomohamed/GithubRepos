//
//  UIImageView+Extension.swift
//  GithubRepos
//
//  Created by eslam mohamed on 10/04/2022.
//

import UIKit

let cache = NetworkManager.shared.cache

extension UIImageView{
    
    func downloadImg(from urlString: String){
        let cacheKy    = NSString(string: urlString)
        if let image   = cache.object(forKey: cacheKy){
            self.image = image
            return
        }
        guard let url = URL(string: urlString) else{
            return}
        let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
            if error != nil {return}
            guard let response = response as? HTTPURLResponse , response.statusCode == 200 else{return}
            guard let data     = data   else{return}
            guard let image    = UIImage(data: data) else{return}
            DispatchQueue.main.async { self.image = image }
        }
        task.resume()
        
    }
    
}
