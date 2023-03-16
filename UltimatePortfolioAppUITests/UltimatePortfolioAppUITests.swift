//
//  UltimatePortfolioAppUITests.swift
//  UltimatePortfolioAppUITests
//
//  Created by Zach Uptin on 16/3/2023.
//

import XCTest

class UltimatePortfolioAppUITests: XCTestCase {
    var app: XCUIApplication!

    override func setUpWithError() throws {
        continueAfterFailure = false

        app = XCUIApplication()
        app.launchArguments = ["enable-testing"]
        app.launch()
    }

    func testAppHas4Tabs() throws {
        XCTAssertEqual(app.tabBars.buttons.count, 4, "There should be 4 tabs in the app.")
    }

//    func testOpenTabAddsProjects() {
//        app.buttons["Open"].tap()
//        XCTAssertEqual(app.tables.cells.count, 0, "There should be no list rows initially.")
//
//        for tapCount in 1...5 {
//            app.buttons["Add Project"].tap()
////            XCTAssertEqual(app.tables.cells.count, tapCount, "There should \(tapCount) list row(s) initially.")
//        }
//    }

//    func testAddingItemInsertRows() {
//        app.buttons["Open"].tap()
//        XCTAssertEqual(app.tables.cells.count, 0, "There should be no list rows initially.")
//
//        app.buttons["Add Project"].tap()
////        XCTAssertEqual(app.tables.cells.count, 1, "There should be 1 list row after adding a project.")
//
//        app.buttons["Add New Item"].tap()
////        XCTAssertEqual(app.tables.cells.count, 2, "There should be 2 list rows after adding an item.")
//    }
//
//    func testingEditingProjectUpdatesCorrectly() {
//        app.buttons["Open"].tap()
////        XCTAssertEqual(app.tables.cells.count, 0, "There should be no list rows initially.")
//
//        app.buttons["Add Project"].tap()
////        XCTAssertEqual(app.tables.cells.count, 1, "There should be 1 list row after adding a project.")
//
//        app.buttons["New Project"].tap()
//        app.textFields["Project name"].tap()
//
//        app.keys["space"].tap()
//        app.keys["more"].tap()
//        app.keys["2"].tap()
//        app.buttons["Return"].tap()
//
//        app.buttons["Open Projects"].tap()
//        XCTAssertTrue(app.buttons["NEW PROJECT 2"].exists, "The new project name should be visible in the list.")
//    }
}
