//
//  PerformanceTests.swift
//  UltimatePortfolioAppTests
//
//  Created by Zach Uptin on 16/3/2023.
//

import CoreData
import XCTest
@testable import UltimatePortfolioApp

class PerformanceTests: BaseTestCase {
    func testAwardCalculationPerformance() throws {
        // Create a significate amount of test data
        for _ in 1...100 {
            try dataController.createSampleData()
        }

        // Simulate lots of award to check
        let awards = Array(repeating: Award.allAwards, count: 25).joined()
        XCTAssertEqual(awards.count, 500, "This checks the awards count is constant. Change this if you add awards.")

        measure {
            _ = awards.filter(dataController.hasEarned)
        }
    }
}
