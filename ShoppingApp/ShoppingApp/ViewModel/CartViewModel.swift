//
//  CartViewModel.swift
//  ShoppingApp
//
//  Created by Dervis YILMAZ on 30.12.2022.
//

import Foundation

class CartViewModel: ObservableObject {
    
    static let shared = CartViewModel()
    
    @Published var shoppingList = [Product]()
    @Published var totalPrice = 0.0
    
    private init(){
        
    }
    
    func loadShoppingList(completion: @escaping (Bool) -> Void) {
        
        // Read/Get Data
        if let data = UserDefaults.standard.data(forKey: "shoppingList") {
            do {
                // Create JSON Decoder
                let decoder = JSONDecoder()

                // Decode Note
                shoppingList = try decoder.decode([Product].self, from: data)
                 totalPrice = UserDefaults.standard.double(forKey: "totalPrice")
                completion(true)

            } catch {
                print("Unable to Decode shoppingList (\(error))")
                completion(false)
            }
        }

        print("loadShoppingList - totalPrice \(totalPrice)")
 
    }
    
    func addToCart(product: Product){
  
        var productIndex = shoppingList.firstIndex(where: {$0.id == product.id})
        if(productIndex == nil){
            var shoppingListProduct = product
            shoppingListProduct.quantity += 1
            totalPrice += Double(shoppingListProduct.quantity) * shoppingListProduct.productPrice
            shoppingList.append(shoppingListProduct)
        }else{
            var shoppingListProduct = shoppingList[productIndex!]
            shoppingListProduct.quantity += 1
            shoppingList[productIndex!] = shoppingListProduct
            totalPrice +=  shoppingListProduct.productPrice
        }
        saveCartToLocal()
        
    }
    
    func removeFromCart(product: Product){
        
        var productIndex = shoppingList.firstIndex(where: {$0.id == product.id})
        if(productIndex != nil){
        
            var shoppingListProduct = shoppingList[productIndex!]
            shoppingListProduct.quantity -= 1
            shoppingList[productIndex!] = shoppingListProduct
            if(shoppingListProduct.quantity == 0){
                shoppingList.remove(at: shoppingList.firstIndex(where: {$0.id == product.id})!)
            }
            totalPrice -= shoppingListProduct.productPrice
          
        }else{
            print("removeFromCart - product index not found in the cart")
        }
        saveCartToLocal()
        
    }
    
    func saveCartToLocal(){

        do {
            // Create JSON Encoder
            let encoder = JSONEncoder()

            // Encode Note
            let data = try encoder.encode(shoppingList)
            // Write/Set Data
            UserDefaults.standard.set(data, forKey: "shoppingList")
            UserDefaults.standard.set(totalPrice, forKey: "totalPrice")

        } catch {
            print("Unable to Encode Array of shoppingList (\(error))")
        }
        
    }
    
    func setEmptyCart(){
        
        totalPrice = 0.0
        shoppingList = [Product]()
        saveCartToLocal()
        
    }
    
}
