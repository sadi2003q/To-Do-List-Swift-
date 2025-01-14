//
//  ListView.swift
//  To Do List
//
//  Created by Sadi on 09/01/2025.
//

import SwiftUI

/// The main view that displays the list of tasks in the To-Do List app.
///
/// `ListView` presents all tasks in a scrollable list, allowing users to **view**, **edit**, **reorder**, and **delete** tasks.
/// It also provides navigation to the task creation screen.
///
/// - Features:
///   - Displays tasks in a dynamic list.
///   - Allows users to mark tasks as complete by tapping on them.
///   - Supports task reordering and deletion.
///   - Shows an empty state when no tasks are available.
///   - Provides navigation to add new tasks.
struct ListView: View {
    
    /// The view model managing the list of tasks.
    @Environment(ListViewModel.self) private var viewModel
    
    /// Controls animation effects within the view.
    @State private var animation = false
    
    var body: some View {
        ZStack {
            TaskView
        }
        .listStyle(.plain)
        .navigationTitle("To Do List 📝")
        .toolbar {
            /// Edit button to enable reordering or deletion of tasks.
            ToolbarItem(placement: .topBarLeading) {
                EditButton()
            }
            
            /// Navigation button to add a new task.
            ToolbarItem(placement: .topBarTrailing) {
                NavigationLink_AddView
            }
        }
    }
    
    /// The main content view that switches between an empty state and a list of tasks.
    private var TaskView: some View {
        Group {
            if viewModel.items.isEmpty {
                /// Shows an empty state view when there are no tasks.
                VStack {
                    ListRowEmptyView()
                }
                .transition(AnyTransition.opacity.animation(.easeIn))
            } else {
                /// Displays the list of tasks when items are present.
                List {
                    ForEach(viewModel.items, id: \.id) { item in
                        ListRowView(item: item)
                            .onTapGesture {
                                /// Toggles task completion with a spring animation.
                                withAnimation(.spring(duration: 0.3)) {
                                    viewModel.updateItem(item: item)
                                }
                            }
                    }
                    .onMove(perform: viewModel.onMove)   // Enables task reordering.
                    .onDelete(perform: viewModel.onDelete) // Enables task deletion.
                }
            }
        }
    }
    
    /// A navigation link to the `AddView` for creating new tasks.
    private var NavigationLink_AddView: some View {
        NavigationLink("Add") {
            AddView()
        }
    }
}

#Preview {
    NavigationStack {
        ListView()
    }
    .environment(ListViewModel(dataSource: SwiftDataService.shared))
}
