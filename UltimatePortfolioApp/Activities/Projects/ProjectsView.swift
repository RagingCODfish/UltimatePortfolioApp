//
//  ProjectsView.swift
//  UltimatePortfolioApp
//
//  Created by Zach Uptin on 21/10/2022.
//

import SwiftUI

struct ProjectsView: View {
	static let openTag: String? = "Open"
	static let closedTag: String? = "Closed"

    @StateObject var viewModel: ViewModel

	var projectsList: some View {
		List {
            ForEach(viewModel.projects) { project in
				Section(header: ProjectHeaderView(project: project)) {
                    ForEach(project.projectItems(using: viewModel.sortOrder)) { item in
						ItemRowView(project: project, item: item)
					}
					.onDelete { offsets in
                        viewModel.delete(offsets, from: project)
					}

                    if viewModel.showClosedProjects == false {
						Button {
                            withAnimation {
                                viewModel.addItem(to: project)
                            }
						} label: {
							Label("Add New Item", systemImage: "plus")
						}
					}
				}
			}
		}
		.listStyle(InsetListStyle())
	}

	var addProjectToolbarItem: some ToolbarContent {
		ToolbarItem(placement: .primaryAction) {
            if viewModel.showClosedProjects == false {
                Button {
                    withAnimation {
                        viewModel.addProject()
                    }
                } label: {
                    Label("Add Project", systemImage: "plus")
				}
			}
		}
	}

	var sortOrderToolbarItem: some ToolbarContent {
		ToolbarItem(placement: .cancellationAction) {
            Menu {
                Button("Optimized") { viewModel.sortOrder = .optimized }
                Button("Creation Date") { viewModel.sortOrder = .creationDate }
                Button("Title") { viewModel.sortOrder = .title }
            } label: {
                Label("Sort", systemImage: "arrow.up.arrow.down")
            }
		}
	}

	var body: some View {
		NavigationView {
			Group {
                if viewModel.projects.isEmpty {
					Text("There's nothing here right now")
						.foregroundColor(.secondary)
				} else {
					projectsList
				}
			}
            .navigationTitle(viewModel.showClosedProjects ? "Closed Projects" : "Open Projects")
			.toolbar {
				addProjectToolbarItem
				sortOrderToolbarItem
			}

			SelectSomethingView()
		}
        .sheet(isPresented: $viewModel.showingUnlockView) {
            UnlockView()
        }
        .onOpenURL(perform: openUrl)
	}

    init(dataController: DataController, showClosedProjects: Bool) {
        let viewModel = ViewModel(dataController: dataController, showClosedProjects: showClosedProjects)
        _viewModel = StateObject(wrappedValue: viewModel)
    }

    func openUrl(_ url: URL) {
        viewModel.addProject()
    }
}

struct ProjectsView_Previews: PreviewProvider {
	static var dataController = DataController.preview

	static var previews: some View {
        ProjectsView(dataController: DataController.preview, showClosedProjects: false)
	}
}
