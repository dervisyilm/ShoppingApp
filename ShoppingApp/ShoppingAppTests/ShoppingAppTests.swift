//
//  ShoppingAppTests.swift
//  ShoppingAppTests
//
//  Created by Erdem Perşembe on 12.04.2022.
//

import XCTest
@testable import ShoppingApp

class ShoppingAppTests: XCTestCase {
    
    private var sut: CartViewModel!
    private var product = Product(productName: "La Lorraine Tombul Ekmek", productDescription: "Doğal ham maddelerden üretilir.Koruyucu ve katkı maddesi içermez.İçindekiler: Un, su, maya, tuz", productPrice: 7.5, productImage: "https://github.com/android-getir/public-files/blob/main/images/5f36a28b29d3b131b9d95548_tr_1637858193743.jpeg")

    override func setUpWithError() throws {
        
        sut = CartViewModel.shared
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        sut = nil
    }
    
    // Create a simple conversation with a positive number
     func test_addToCart() {
      
         sut.addToCart(product: product)
         XCTAssertGreaterThan(sut.totalPrice, 0.0)
         XCTAssertGreaterThan(sut.shoppingList.count, 0)
         
     }
    func test_removeFromCart(){
        
        sut.addToCart(product: product)
        sut.removeFromCart(product: product)
        XCTAssertEqual(sut.totalPrice, 0.0)
        XCTAssertEqual(sut.shoppingList.count, 0)
       
    }
    func test_setEmptyCart(){
        
        sut.setEmptyCart()
        XCTAssertEqual(sut.totalPrice, 0.0)
        XCTAssertEqual(sut.shoppingList.count, 0)
    }

}
