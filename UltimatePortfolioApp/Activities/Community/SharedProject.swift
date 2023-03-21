//
//  SharedProject.swift
//  UltimatePortfolioApp
//
//  Created by Zach Uptin on 21/3/2023.
//

import Foundation

struct SharedProject: Identifiable {
    let id: String
    let title: String
    let detail: String
    let owner: String
    let closed: Bool

    static let example = SharedProject(id: "1", title: "Example", detail: "Detail", owner: "Zach", closed: false)
}
