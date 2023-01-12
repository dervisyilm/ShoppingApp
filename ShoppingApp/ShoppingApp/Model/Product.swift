//
//  Product.swift
//  ShoppingApp
//
//  Created by Dervis YILMAZ on 29.12.2022.
//

import Foundation
import UIKit
// MARK: - Product
struct Product: Identifiable, Codable {
    
    enum CodingKeys: CodingKey {
        case productName
        case productDescription
        case productPrice
        case productImage
    }
    
    let id = UUID()
    let productName: String
    let productDescription: String
    let productPrice: Double
    let productImage: String
    var quantity = 0
        
}
