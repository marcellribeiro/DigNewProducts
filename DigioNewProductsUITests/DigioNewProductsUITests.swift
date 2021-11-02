//
//  DigioNewProductsUITests.swift
//  DigioNewProductsUITests
//
//  Created by Marcell Ribeiro on 02/11/21.
//

import XCTest

class DigioNewProductsUITests: XCTestCase {
    var app: XCUIApplication!

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.

        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false
        app = XCUIApplication()

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() throws {
        app.launch()

        XCTAssertTrue(app.otherElements["mainViewController"].exists)

        // Wait for greetingsLabel change text when network call succeed
        let predicate = NSPredicate(format: "label BEGINSWITH 'Olá,'")
        expectation(for: predicate, evaluatedWith: app.staticTexts.element(matching: predicate), handler: nil)
        waitForExpectations(timeout: 5, handler: nil)

        // Verify Labels
        XCTAssertTrue(app.staticTexts.element(matching: .any, identifier: "digio").exists)
        XCTAssertTrue(app.staticTexts.element(matching: .any, identifier: "Cash").exists)
        XCTAssertTrue(app.staticTexts.element(matching: .any, identifier: "Produtos").exists)

        // Verify other views
        XCTAssertTrue(app.collectionViews["spotlightCollectionView"].exists)
        XCTAssertTrue(app.collectionViews["productsCollectionView"].exists)
        XCTAssertTrue(app.images["digioCashImageView"].exists)

        // Verify and tap transparent cash button
        let digioCashButton = app.buttons["digioCashButton"]
        XCTAssertTrue(digioCashButton.exists)
        digioCashButton.tap()

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
