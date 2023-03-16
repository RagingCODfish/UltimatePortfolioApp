//
//  Binding-OnChange.swift
//  UltimatePortfolioApp
//
//  Created by Zach Uptin on 24/10/2022.
//

import SwiftUI

extension Binding {
    func onChange(_ handler: @escaping () -> Void) -> Binding<Value> {
        Binding(
            get: { self.wrappedValue },
            set: { newValue in
                self.wrappedValue = newValue
                handler()
            }
        )
    }
}
