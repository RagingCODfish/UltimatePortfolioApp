//
//  UltimatePortfolioAppApp.swift
//  UltimatePortfolioApp
//
//  Created by Zach Uptin on 14/10/2022.
//

import SwiftUI

@main
struct UltimatePortfolioAppApp: App {
//    @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate
    @StateObject var dataController: DataController
    @StateObject var unlockManager: UnlockManager

    init() {
        let dataController = DataController()
        let unlockManager = UnlockManager(dataController: dataController)

        _dataController = StateObject(wrappedValue: dataController)
        _unlockManager = StateObject(wrappedValue: unlockManager)

        #if targetEnvironment(simulator)
        // Force a specific username becuase Sign In With Apple doesn't work in the simulator
        UserDefaults.standard.set("Zach", forKey: "username")
        #endif

    }

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, dataController.container.viewContext)
                .environmentObject(dataController)
                .environmentObject(unlockManager)
                .onReceive(
					// Automatically save when we detect that we are no longer the foreground app.
					// Use this rather then the scene phase API so we can port to macOS,
					// where scene phase won't detect our app losing focus as of macOS 11.1.
					NotificationCenter.default.publisher(for: UIApplication.willResignActiveNotification),
						   perform: save
                )
                .onAppear(perform: dataController.appLaunched)
        }
    }

    func save(_ note: Notification) {
        dataController.save()
    }
}
