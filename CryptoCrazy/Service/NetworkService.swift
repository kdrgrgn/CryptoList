//
//  NetworkService.swift
//  CryptoCrazy
//
//  Created by kadir on 7.01.2023.
//

import Foundation


class NetworkService {
    
    func downloadCurrencies(url: URL, completion: @escaping ([CryptoCurrency]?) ->()) {
        URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                print(error.localizedDescription)
                completion(nil)
            } else if let data = data {
                if let cryptoList = try?   JSONDecoder().decode([CryptoCurrency].self, from: data) {
                    completion(cryptoList)
                }
                
               
            }
        }.resume()
    }
}
