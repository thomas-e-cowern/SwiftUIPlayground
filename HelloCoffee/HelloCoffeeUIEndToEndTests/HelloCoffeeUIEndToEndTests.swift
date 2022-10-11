//
//  HelloCoffeeUIEndToEndTests.swift
//  HelloCoffeeUIEndToEndTests
//
//  Created by Thomas Cowern on 10/7/22.
//

import XCTest

final class when_adding_a_new_coffee_order: XCTestCase {
    
    private var app: XCUIApplication
    
    override func setUp() async throws {
        app = XCUIApplication()
        continueAfterFailure = false
        app.launchEnvironment = ["ENV": "TEST"]
        
        app.buttons["addNewOrderButton"].tap()
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
