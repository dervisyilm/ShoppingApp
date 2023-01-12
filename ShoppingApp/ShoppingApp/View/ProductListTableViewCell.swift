//
//  ProductListTableViewCell.swift
//
//  Created by Dervis YILMAZ on 29.12.2022.
//

import UIKit

class ProductListTableViewCell: UITableViewCell {

    @IBOutlet weak var productName: UILabel!
    @IBOutlet weak var productDescription: UILabel!
    @IBOutlet weak var productPrice: UILabel!
    @IBOutlet weak var productImageView: UIImageView!
    
    // Setup movies values
    func setCellWithValuesOf(_ product:Product) {
        updateUI(productName: product.productName, productDescription: product.productDescription, productPrice: product.productPrice, productImage: product.productImage)
    }
    
    // Update the UI Views
    private func updateUI(productName: String, productDescription: String, productPrice: Double, productImage: String) {
        
        self.productName.text = productName
        self.productDescription.text = productDescription
        self.productPrice.text = String("$\(productPrice)")
        self.productImageView.load(url: URL(string: "\(productImage)?raw=true" )!)
        
    }
    
}

