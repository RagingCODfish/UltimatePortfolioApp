//
//  PlatformAdjustments.swift
//  UltimatePortfolioApp
//
//  Created by Zach Uptin on 30/3/2023.
//

import SwiftUI

extension Notification.Name {
    static let willResignActive = UIApplication.willResignActiveNotification
}

struct StackNavigationView<Content: View>: View {
    @ViewBuilder let content: () -> Content

    var body: some View {
        NavigationView(content: content)
            .navigationViewStyle(.stack)
    }
}
