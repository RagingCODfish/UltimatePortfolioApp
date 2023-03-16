//
//  AssetTests.swift
//  UltimatePortfolioAppTests
//
//  Created by Zach Uptin on 16/3/2023.
//

import XCTest
@testable import UltimatePortfolioApp

class AssetTests: XCTestCase {
    func testColorsExist() {
        for color in Project.colors {
            XCTAssertNotNil(UIColor(named: color), "Failed to load color \(color) from asset catalog.")
        }
    }

    func testJSONLoadsCorrectly() {
        XCTAssertFalse(Award.allAwards.isEmpty, "Failed to load awards from JSON")
    }
}
