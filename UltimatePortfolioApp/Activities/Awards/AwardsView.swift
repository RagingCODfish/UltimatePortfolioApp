//
//  AwardsView.swift
//  UltimatePortfolioApp
//
//  Created by Zach Uptin on 25/10/2022.
//

import SwiftUI

struct AwardsView: View {
	static let tag: String? = "Awards"

	@EnvironmentObject var dataController: DataController
	@State private var selectedAward = Award.example
	@State private var showingAwardDetails = false

	var columns: [GridItem] {
		[GridItem(.adaptive(minimum: 100, maximum: 100))]
	}

	var body: some View {
		StackNavigationView {
			ScrollView {
				LazyVGrid(columns: columns) {
					ForEach(Award.allAwards) { award in
						Button {
							selectedAward = award
							showingAwardDetails = true
						} label: {
							Image(systemName: award.image)
								.resizable()
								.scaledToFit()
								.padding()
								.frame(width: 100, height: 100)
								.foregroundColor(dataController.hasEarned(award: award) ? Color(award.color) : Color.secondary.opacity(0.5))
						}
                        .buttonStyle(.borderless)
					}
				}
			}
			.navigationTitle("Awards")
		}
		.alert(isPresented: $showingAwardDetails) {
			if dataController.hasEarned(award: selectedAward) {
				return Alert(title: Text("Unlocked: \(selectedAward.name)"),
							 message: Text(selectedAward.description),
							 dismissButton: .default(Text("Ok")))
			} else {
				return Alert(title: Text("Locked"), message: Text(selectedAward.description), dismissButton: .default(Text("Ok")))
			}
		}
	}
}

struct AwardsView_Previews: PreviewProvider {
	static var previews: some View {
		AwardsView()
	}
}
