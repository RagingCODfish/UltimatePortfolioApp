//
//  Item-CoreDataHelpers.swift
//  UltimatePortfolioApp
//
//  Created by Zach Uptin on 24/10/2022.
//

import Foundation

extension Item {
    enum SortOrder {
        case optimized, title, creationDate
    }

    var itemTitle: String {
        title ?? NSLocalizedString("New Item", comment: "Create a new item")
    }

    var itemDetail: String {
        detail ?? ""
    }

    var itemCreationDate: Date {
        creationDate ?? Date()
    }

    static var example: Item {
        let controller = DataController.preview
        let viewContext = controller.container.viewContext

        let item = Item(context: viewContext)
        item.title = "Example Item"
        item.detail = "This is an example Item"
        item.priority = 3
        item.creationDate = Date()

        return item
    }

}
