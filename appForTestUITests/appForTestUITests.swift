//
//  appForTestUITests.swift
//  appForTestUITests
//
//  Created by Антон Бобрышев on 04.12.2021.
//

import XCTest

class appForTestUITests: XCTestCase {

    override func setUpWithError() throws {
        continueAfterFailure = false
    }

    override func tearDownWithError() throws {
    }

    func testExample() throws {
        let app = XCUIApplication()
        app.launch()
        
        app.textFields["LoginTF"].tap()
        app.textFields["LoginTF"].typeText("User Login")
        
        app.buttons["Next:"].tap()
        
        app.textFields["PasswordTF"].typeText("qwerty")
        
        app.buttons["Done"].tap()
        
        
        XCTAssert(app.alerts["Warning"].descendants(matching: .staticText)["Invalid Fields"].waitForExistence(timeout: 1.0))
    }
    
    func testNextScreenExistsAfterLogin() throws {
        let app = XCUIApplication()
        app.launch()
        
        app.textFields["LoginTF"].tap()
        app.textFields["LoginTF"].typeText("User Login")
        
        app.buttons["Next:"].tap()
        
        app.textFields["PasswordTF"].typeText("qwerty")
        
        app.buttons["Done"].tap()
        
        XCTAssert(app.navigationBars["Main"].waitForExistence(timeout: 1.0))
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
