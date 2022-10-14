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
        let placeOrderButton = app.buttons["placeOrderButton"]
        
        let collectionViewsQuery = app.collectionViews
        
        collectionViewsQuery.buttons["Small"].tap()
        
        nameTextField.tap()
        nameTextField.typeText("John")
        
        coffeeNameTextField.tap()
        coffeeNameTextField.typeText("Hot Coffee")
        
        priceTextField.tap()
        priceTextField.typeText("4.50")
        
        // place the order
        placeOrderButton.tap()
    }
    
    func test_should_update_order_successfully() {
        
 //       ************************************
        
//        app.navigationBars["_TtGC7SwiftUI32NavigationStackHosting"]/*@START_MENU_TOKEN@*/.buttons["addNewOrderButton"]/*[[".otherElements[\"Add Order\"]",".buttons[\"Add Order\"]",".buttons[\"addNewOrderButton\"]",".otherElements[\"addNewOrderButton\"]"],[[[-1,2],[-1,1],[-1,3,1],[-1,0,1]],[[-1,2],[-1,1]]],[0]]@END_MENU_TOKEN@*/.tap()
//
//        let collectionViewsQuery2 = app.collectionViews
//        collectionViewsQuery2/*@START_MENU_TOKEN@*/.textFields["name"]/*[[".cells",".textFields[\"Name\"]",".textFields[\"name\"]"],[[[-1,2],[-1,1],[-1,0,1]],[[-1,2],[-1,1]]],[0]]@END_MENU_TOKEN@*/.tap()
//
//        let coffeenameTextField = collectionViewsQuery2/*@START_MENU_TOKEN@*/.textFields["coffeeName"]/*[[".cells",".textFields[\"Coffee Name\"]",".textFields[\"coffeeName\"]"],[[[-1,2],[-1,1],[-1,0,1]],[[-1,2],[-1,1]]],[0]]@END_MENU_TOKEN@*/
//        coffeenameTextField.tap()
//
//        let priceTextField = collectionViewsQuery2/*@START_MENU_TOKEN@*/.textFields["price"]/*[[".cells",".textFields[\"Price\"]",".textFields[\"price\"]"],[[[-1,2],[-1,1],[-1,0,1]],[[-1,2],[-1,1]]],[0]]@END_MENU_TOKEN@*/
//        priceTextField.tap()
//
//        let collectionViewsQuery = collectionViewsQuery2
//        collectionViewsQuery/*@START_MENU_TOKEN@*/.buttons["Small"]/*[[".cells",".segmentedControls[\"coffeeSize\"].buttons[\"Small\"]",".buttons[\"Small\"]"],[[[-1,2],[-1,1],[-1,0,1]],[[-1,2],[-1,1]]],[0]]@END_MENU_TOKEN@*/.tap()
//        collectionViewsQuery/*@START_MENU_TOKEN@*/.buttons["placeOrderButton"]/*[[".cells",".buttons[\"Place Order\"]",".buttons[\"placeOrderButton\"]"],[[[-1,2],[-1,1],[-1,0,1]],[[-1,2],[-1,1]]],[0]]@END_MENU_TOKEN@*/.tap()
//
//        let app2 = app
//        app2.collectionViews["orderList"]/*@START_MENU_TOKEN@*/.buttons["orderNameText-coffeeNameAndSizeText-coffeePriceText"]/*[[".cells",".buttons[\"John, Hot Coffee (Small), $4.50\"]",".buttons[\"orderNameText-coffeeNameAndSizeText-coffeePriceText\"]"],[[[-1,2],[-1,1],[-1,0,1]],[[-1,2],[-1,1]]],[0]]@END_MENU_TOKEN@*/.tap()
//
//        let app = app2
//        app/*@START_MENU_TOKEN@*/.buttons["editOrderButton"]/*[[".buttons[\"Edit Order\"]",".buttons[\"editOrderButton\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
//
//        let nameTextField = collectionViewsQuery/*@START_MENU_TOKEN@*/.textFields["name"]/*[[".cells",".textFields[\"Name\"]",".textFields[\"name\"]"],[[[-1,2],[-1,1],[-1,0,1]],[[-1,2],[-1,1]]],[0]]@END_MENU_TOKEN@*/
//        nameTextField.tap()
//        nameTextField.tap()
//        coffeenameTextField.tap()
//        coffeenameTextField.tap()
//        priceTextField.tap()
//        priceTextField.tap()
//        priceTextField.swipeLeft()
//        collectionViewsQuery/*@START_MENU_TOKEN@*/.buttons["Medium"]/*[[".cells",".segmentedControls[\"coffeeSize\"].buttons[\"Medium\"]",".buttons[\"Medium\"]"],[[[-1,2],[-1,1],[-1,0,1]],[[-1,2],[-1,1]]],[0]]@END_MENU_TOKEN@*/.tap()
//        collectionViewsQuery/*@START_MENU_TOKEN@*/.buttons["placeOrderButton"]/*[[".cells",".buttons[\"Update Order\"]",".buttons[\"placeOrderButton\"]"],[[[-1,2],[-1,1],[-1,0,1]],[[-1,2],[-1,1]]],[0]]@END_MENU_TOKEN@*/.tap()
//        app.staticTexts["Hot Coffee Edit"].tap()
                                
        
 //       ************************************
        
        let orderList = app.collectionViews["orderList"]
        orderList.buttons["orderNameText-coffeeNameAndSizeText-coffeePriceText"].tap()
        
        app.buttons["editOrderButton"].tap()
        
        let collectionViewsQuery = app.collectionViews
        
        collectionViewsQuery.buttons["Medium"].tap()
        
        let nameTextField = app.textFields["name"]
        let coffeeNameTextField = app.textFields["coffeeName"]
        let priceTextField = app.textFields["price"]
        let placeOrderButton = app.buttons["placeOrderButton"]
        
        let _ = nameTextField.waitForExistence(timeout: 2)
        nameTextField.tap(withNumberOfTaps: 2, numberOfTouches: 1)
        nameTextField.typeText("John Edit")
        
        let _ = coffeeNameTextField.waitForExistence(timeout: 2)
        coffeeNameTextField.tap(withNumberOfTaps: 2, numberOfTouches: 1)
        coffeeNameTextField.typeText("Hot Coffee Edit")
        
        let _ = priceTextField.waitForExistence(timeout: 2)
        priceTextField.tap(withNumberOfTaps: 2, numberOfTouches: 1)
        priceTextField.typeText("7.50")
        
        placeOrderButton.tap()
        
        XCTAssertEqual("Hot Coffee Edit", app.staticTexts["coffeeNameAndSize"].label)
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
        let coffeeSizePicker = app.pickerWheels["coffeeSize"].segmentedControls
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
