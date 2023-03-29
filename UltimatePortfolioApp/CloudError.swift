//
//  CloudError.swift
//  UltimatePortfolioApp
//
//  Created by Zach Uptin on 29/3/2023.
//

import Foundation

struct CloudError: Identifiable, ExpressibleByStringInterpolation {
    var id: String { message }
    var message: String

    init(stringLiteral value: String) {
        self.message = value
    }
}
