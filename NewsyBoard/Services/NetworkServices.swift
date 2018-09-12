//
//  NetworkServices.swift
//  NewsyBoard
//
//  Created by Macbook on 8.09.2018.
//  Copyright © 2018 Ali Ozan. All rights reserved.
//

import Foundation


class NetworkServices {
    
    private init(){}

    static let version = "v2"
    static let tophead = "top-headlines"
    static let everything = "everything"
    private static let  ApiKey = "d85af49e60034e1c895a4b3c71d30100"
    
    let base_url = "https://newsapi.org/\(version)/\(tophead)?country=us&apiKey=\(ApiKey)"
    
    static let shared = NetworkServices()
    
    func getData(completion: @escaping (Any) -> Void ) {
        
        guard let URL = URL(string: base_url )else{ return }
        
        let session = URLSession.shared
        
        session.dataTask(with: URL) { (data, response, error) in
            
            if error != nil {
                print(error as Any)
                return
            }
            
       guard let data = data else { return }
            
            print(data)
            completion(data)
    
        }.resume()
        
    }
    
    
    
 
    
    
    
}
