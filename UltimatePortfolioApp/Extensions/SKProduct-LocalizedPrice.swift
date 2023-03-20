//
//  SKProduct-LocalizedPrice.swift
//  UltimatePortfolioApp
//
//  Created by Zach Uptin on 20/3/2023.
//

import StoreKit

extension SKProduct {
    var localizedPrice: String {
        let formatter = NumberFormatter()
        formatter.numberStyle = .currency
        formatter.locale = priceLocale
        return formatter.string(from: price)!
    }
}
