//
//  HelloCoffeeUIEndToEndTests.swift
//  HelloCoffeeUIEndToEndTests
//
//  Created by Thomas Cowern on 10/7/22.
//

import XCTest

final class when_adding_a_new_coffee_order: XCTestCase {
    
    private var app: XCUIApplication!
    
    override func setUp() {
        app = XCUIApplication()
        continueAfterFailure = false
        app.launchEnvironment = ["ENV": "TEST"]
        
        app.buttons["addNewOrderButton"].tap()
        
        let nameTextField = app.textFields["name"]
        let coffeeNameTextField = app.textFields["coffeeName"]
        let priceTextField = app.textFields["price"]
        let placeOrderButton = app.textFields["placeOrderButton"]
        
        nameTextField.tap()
        nameTextField.typeText("Bill")
        
        coffeeNameTextField.tap()
        coffeeNameTextField.typeText("Hot Coffee")
        
        priceTextField.tap()
        priceTextField.typeText("2.50")
        
        placeOrderButton.tap()
    }
    
    func test_should_display_coffee_order_in_list_successfully() throws {
        XCTAssertEqual("Bill", app.staticTexts["orderNameText"].label)
        XCTAssertEqual("Hot Coffee", app.staticTexts["coffeeNameAndSizeText"].label)
        XCTAssertEqual("$2.50", app.textFields["coffeePriceText"].label)
    }
}


final class HelloCoffeeUIEndToEndTests: XCTestCase {

    func test_should_make_sure_no_orders_displayed() throws {
        
        let app = XCUIApplication()
        
        continueAfterFailure = false
        
        app.launchEnvironment = ["ENV": "TEST"]
        app.launch()
        
        XCTAssertEqual("No orders available", app.staticTexts["noOrdersText"].label)
        
    }
}
