//
//  PlatformAdjustments.swift
//  UltimatePortfolioMac
//
//  Created by Zach Uptin on 30/3/2023.
//

import SwiftUI

typealias InsetGroupedListStyle = SidebarListStyle

extension Notification.Name {
    static let willResignActive = NSApplication.willResignActiveNotification
}

struct StackNavigationView<Content: View>: View {
    @ViewBuilder let content: () -> Content

    var body: some View {
        VStack(spacing: 0, content: content)

    }
}
