//
//  ChartListTableViewCell.swift
//  ShoppingApp
//
//  Created by Dervis YILMAZ on 30.12.2022.
//

import Foundation
import UIKit

class ChartListTableViewCell: UITableViewCell {

    @IBOutlet weak var productName: UILabel!
    @IBOutlet weak var productPrice: UILabel!
    @IBOutlet weak var productImageView: UIImageView!
    
    // Setup movies values
    func setCellWithValuesOf(_ product:Product) {
        updateUI(productName: product.productName, productPrice: product.productPrice, productImage: product.productImage)
    }
    
    // Update the UI Views
    private func updateUI(productName: String, productPrice: Double, productImage: String) {
        
        self.productName.text = productName
        self.productPrice.text = String("$\(productPrice)")
        
        self.productImageView.load(url: URL(string: "\(productImage)?raw=true" )!)
        
    }
    
}
