//
//  UltimatePortfolioAppTests.swift
//  UltimatePortfolioAppTests
//
//  Created by Zach Uptin on 16/3/2023.
//

import CoreData
import XCTest
@testable import UltimatePortfolioApp

class BaseTestCase: XCTestCase {
    var dataController: DataController!
    var managedObjectContext: NSManagedObjectContext!

    override func setUpWithError() throws {
        dataController = DataController(inMemory: true)
        managedObjectContext = dataController.container.viewContext
    }
}
