//
//  ApiService.swift
//  Rest API
//
//  Created by Dervis YILMAZ on 29.12.2022.
//

import Foundation

class ApiService {
    
    func getProductFromURL(completion: @escaping (Result<[Product], Error>) -> Void) {
        // define URL string
        guard let url = URL(string: Constants.productURL) else {
            return
        }
        
        // Request url and response data
        let task = URLSession.shared.dataTask(with: url) { [weak self] data, response, error in
            guard let data = data, error == nil else {
                print("ApiService - getProductFromURL- something is wrong")
                return
            }
            // Convert from data to JSON
            do {
                let products = try JSONDecoder().decode([Product].self, from: data)
                DispatchQueue.main.async {
                    completion(.success(products))
                }
                
            } catch  {
                print("ApiService - getProductFromURL- failed to convert product json \(error.localizedDescription)")
                completion(.failure(error))
            }
            
        }
        task.resume()
        
    }
        
        
}
