//
//  ProductDetailViewController.swift
//  ShoppingApp
//
//  Created by Dervis YILMAZ on 29.12.2022.
//

import UIKit

class ProductDetailViewController: UIViewController {
    
    @IBOutlet weak var productName: UILabel!
    @IBOutlet weak var productImageView: UIImageView!
    @IBOutlet weak var productDescription: UILabel!
    @IBOutlet weak var productPrice: UILabel!
    @IBOutlet weak var productQuantity: UILabel!
    
    var product: Product!
    
    override func viewDidLoad() {

        super.viewDidLoad()
//        self.productImageView.load(url: URL(string: product!.productImage)!)
        self.productImageView.load(url: URL(string: "\(product!.productImage)?raw=true" )!)
        self.productName.text = product!.productName
        self.productPrice.text = String("$\(product!.productPrice)")
        self.productDescription.text = product!.productDescription
        self.productQuantity.text = String(product!.quantity)
        
    }
    
    @IBAction func addToChartAction(sender:AnyObject){
        CartViewModel.shared.addToCart(product: product)
        self.productQuantity.text = String(CartViewModel.shared.shoppingList.first(where: {$0.id == product.id})!.quantity)
      
    }
    
    @IBAction func removeFromCartAction(sender:AnyObject){
        CartViewModel.shared.removeFromCart(product: product)
        if(CartViewModel.shared.shoppingList.first(where: {$0.id == product.id}) == nil){
            self.productQuantity.text = String("0")
        }else{
            self.productQuantity.text = String(CartViewModel.shared.shoppingList.first(where: {$0.id == product.id})!.quantity)
        }
    }
    
}
