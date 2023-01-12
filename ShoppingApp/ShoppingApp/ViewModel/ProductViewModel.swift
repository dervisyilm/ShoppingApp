//
//  ProductViewModel.swift
//  ShoppingApp
//
//  Created by Dervis YILMAZ on 29.12.2022.
//

import Foundation

class ProductViewModel: ObservableObject {
    
    private var apiService = ApiService()
    @Published var productList = [Product]()
    
    func fetchProducts(completion: @escaping (Bool) -> Void) {
        
        // weak self - prevent retain cycles
        apiService.getProductFromURL { [weak self] (result) in
            
            switch result {
                case .success(let productList):
                    self?.productList = productList
                    completion(true)
                case .failure(let error):
                    // Something is wrong with the JSON file or the model
                    print("fetchProducts - Error processing json data: \(error)")
                    completion(false)
            }
        }
    }
    
}
