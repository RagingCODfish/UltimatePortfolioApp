//
//  CloudError.swift
//  UltimatePortfolioApp
//
//  Created by Zach Uptin on 29/3/2023.
//

import SwiftUI

struct CloudError: Identifiable, ExpressibleByStringInterpolation {
    var id: String { message }
    var message: String

    var localizedMessage: LocalizedStringKey {
        LocalizedStringKey(message)
    }

    init(stringLiteral value: String) {
        self.message = value
    }
}
