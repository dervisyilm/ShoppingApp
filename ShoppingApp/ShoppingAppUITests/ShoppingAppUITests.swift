//
//  ShoppingAppUITests.swift
//  ShoppingAppUITests
//
//  Created by Erdem Perşembe on 12.04.2022.
//

import XCTest

class ShoppingAppUITests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.

        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() throws {
        // UI tests must launch the application that they test.

        // Use recording to get started writing UI tests.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }
    
    func testBtnAddToCart() throws {
        // UI tests must launch the application that they test.
        let app = XCUIApplication()
        app.launch()
        
        let tableCell = app.cells["productListCell"]
        XCTAssertTrue(tableCell.exists)
        tableCell.firstMatch.tap()
        
        let btnAddToCart = app.buttons["btnAddToCart"]
        XCTAssertTrue(btnAddToCart.exists)
        btnAddToCart.tap()

        // Use recording to get started writing UI tests.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }
    
    func testBtnRemoveFromCart() throws {
        // UI tests must launch the application that they test.
        let app = XCUIApplication()
        app.launch()
        
        let tableCell = app.cells["productListCell"]
        XCTAssertTrue(tableCell.exists)
        tableCell.firstMatch.tap()
        
        let btnAddToCart = app.buttons["btnAddToCart"]
        XCTAssertTrue(btnAddToCart.exists)
        btnAddToCart.tap()
        
        let btnRemoveFromCart = app.buttons["btnRemoveFromCart"]
        XCTAssertTrue(btnRemoveFromCart.exists)
        btnRemoveFromCart.tap()
        // Use recording to get started writing UI tests.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }
    
    func testBtnTotalAmount() throws {
        // UI tests must launch the application that they test.
        let app = XCUIApplication()
        app.launch()
    
        let btnTotalAmount = app.buttons["btnTotalAmount"]
        XCTAssertTrue(btnTotalAmount.exists)

        btnTotalAmount.tap()
        // Use recording to get started writing UI tests.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }
    
    func testBtnCheckout() throws {
        // UI tests must launch the application that they test.
        let app = XCUIApplication()
        app.launch()
        
        let btnTotalAmount = app.buttons["btnTotalAmount"]
        XCTAssertTrue(btnTotalAmount.exists)

        btnTotalAmount.tap()
        
        let btnCheckout = app.buttons["btnCheckout"]
        XCTAssertTrue(btnCheckout.exists)
        btnCheckout.tap()
        
        let alertCheckout = app.alerts["Checkout"]
        XCTAssertTrue(alertCheckout.exists)
        alertCheckout.tap()
        // Use recording to get started writing UI tests.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }
    
    func testLaunchPerformance() throws {
        if #available(macOS 10.15, iOS 13.0, tvOS 13.0, watchOS 7.0, *) {
            // This measures how long it takes to launch your application.
            measure(metrics: [XCTApplicationLaunchMetric()]) {
                XCUIApplication().launch()
            }
        }
    }
}
