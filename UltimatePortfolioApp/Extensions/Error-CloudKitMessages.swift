//
//  Error-CloudKitMessages.swift
//  UltimatePortfolioApp
//
//  Created by Zach Uptin on 29/3/2023.
//

import CloudKit
import Foundation

extension Error {
    func getCloudKitError() -> CloudError {
        guard let error = self as? CKError else {
            return "An unknown error ovvuerred: \(self.localizedDescription)"
        }

        switch error.code {
        case .badContainer, .badDatabase, .invalidArguments:
            return "A fatal error occurred: \(error.localizedDescription)"
        case .networkFailure, .networkUnavailable, .serverResponseLost:
            return "There was a problem communicating with iCloud; please check your network connection and try again."
        case .serviceUnavailable:
            return "iCloud is down. Try again later."
        case .notAuthenticated:
            return "There was a problem with your iCloud account; please check that you're logged in to iCloud."
        case .requestRateLimited:
            return "You've hit iCloud's rate limit; please wait a moment then try again."
        case .quotaExceeded:
            return "You've exceeded your iCloud quote; please clear up some space then try again."


        default:
            return "An unknown error ovvuerred: \(error.localizedDescription)"
        }
    }
}
