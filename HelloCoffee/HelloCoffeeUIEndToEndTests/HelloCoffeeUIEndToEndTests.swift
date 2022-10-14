//
//  HelloCoffeeUIEndToEndTests.swift
//  HelloCoffeeUIEndToEndTests
//
//  Created by Thomas Cowern on 10/7/22.
//

import XCTest

final class when_updating_an_existing_order: XCTestCase {
    
    private var app: XCUIApplication!
    
    // called before running each test
    override func setUp() {
        
        app = XCUIApplication()
        continueAfterFailure = false
        app.launchEnvironment = ["ENV": "TEST"]
        app.launch()
        
        // go to place order screen
        app.buttons["addNewOrderButton"].tap()
        // fill out the textfields
        let nameTextField = app.textFields["name"]
        let coffeeNameTextField = app.textFields["coffeeName"]
        let priceTextField = app.textFields["price"]
        let coffeeSizePicker = app.textFields["coffeeSize"]
        let placeOrderButton = app.buttons["placeOrderButton"]
        
        nameTextField.tap()
        nameTextField.typeText("John")
        
        coffeeNameTextField.tap()
        coffeeNameTextField.typeText("Hot Coffee")
        
        priceTextField.tap()
        priceTextField.typeText("4.50")
        
        coffeeSizePicker.adjust(toPickerWheelValue: "Small")
        
        // place the order
        placeOrderButton.tap()
    }
    
    func test_should_update_order_successfully() {
        
    }
    
    // called after running each test
    override func tearDown() {
        Task {
            guard let url = URL(string: "/test/clear-orders", relativeTo: URL(string: "https://island-bramble.glitch.me")!) else { return }
            let (_, _) = try! await URLSession.shared.data(from: url)
        }
    }
}

final class when_deleting_an_order: XCTestCase {
    
    private var app: XCUIApplication!
    
    override func setUp() {
        app = XCUIApplication()
        continueAfterFailure = false
        app.launchEnvironment = ["ENV": "TEST"]
        app.launch()
        
        // go to place order screen
        app.buttons["addNewOrderButton"].tap()
        // fill out the textfields
        let nameTextField = app.textFields["name"]
        let coffeeNameTextField = app.textFields["coffeeName"]
        let priceTextField = app.textFields["price"]
        let placeOrderButton = app.buttons["placeOrderButton"]
        
        nameTextField.tap()
        nameTextField.typeText("John")
        
        coffeeNameTextField.tap()
        coffeeNameTextField.typeText("Hot Coffee")
        
        priceTextField.tap()
        priceTextField.typeText("4.50")
        
        // place the order
        placeOrderButton.tap()
    }
    
    func test_should_delete_order_successfully() {
        let collectionView = XCUIApplication().collectionViews
        let cellsQuery = collectionView.cells
        let element = cellsQuery.children(matching: .other).element(boundBy: 1).children(matching: .other).element
        element.swipeLeft()
        collectionView.buttons["Delete"].tap()
        
        let orderList = app.collectionViews["orderList"]
        XCTAssertEqual(0, orderList.cells.count)
    }
    
    // called after running each test
    override func tearDown() {
        Task {
            guard let url = URL(string: "/test/clear-orders", relativeTo: URL(string: "https://island-bramble.glitch.me")!) else { return }
            let (_, _) = try! await URLSession.shared.data(from: url)
        }
    }
}

final class when_adding_a_new_coffee_order: XCTestCase {
    
    private var app: XCUIApplication!
    
    // called before running each test
    override func setUp() {
        
        app = XCUIApplication()
        continueAfterFailure = false
        app.launchEnvironment = ["ENV": "TEST"]
        app.launch()
        
        // go to place order screen
        app.buttons["addNewOrderButton"].tap()
        // fill out the textfields
        let nameTextField = app.textFields["name"]
        let coffeeNameTextField = app.textFields["coffeeName"]
        let priceTextField = app.textFields["price"]
        let coffeeSizePicker = app.textFields["coffeeSize"]
        let placeOrderButton = app.buttons["placeOrderButton"]
        
        nameTextField.tap()
        nameTextField.typeText("John")
        
        coffeeNameTextField.tap()
        coffeeNameTextField.typeText("Hot Coffee")
        
        priceTextField.tap()
        priceTextField.typeText("4.50")
        
        coffeeSizePicker.adjust(toPickerWheelValue: "Small")
        
        // place the order
        placeOrderButton.tap()
    }
    
    func test_should_display_coffee_order_in_list_successfully() throws {
        
        XCTAssertEqual("John", app.staticTexts["orderNameText"].label)
        XCTAssertEqual("Hot Coffee (Medium)", app.staticTexts["coffeeNameAndSizeText"].label)
        XCTAssertEqual("$4.50", app.staticTexts["coffeePriceText"].label)
    }
    
    // called after running each test
    override func tearDown() {
        Task {
            guard let url = URL(string: "/test/clear-orders", relativeTo: URL(string: "https://island-bramble.glitch.me")!) else { return }
            let (_, _) = try! await URLSession.shared.data(from: url)
        }
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
