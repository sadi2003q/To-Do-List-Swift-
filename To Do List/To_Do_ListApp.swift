//
//  To_Do_ListApp.swift
//  To Do List
//
//  Created by Sadi on 09/01/2025.
//

import SwiftUI
import SwiftData

/// # To_Do_ListApp
///
/// The entry point for the **To-Do List** application.
///
/// ## Overview
///
/// `To_Do_ListApp` sets up the main interface for the app by initializing the necessary views and data models.
/// It uses a `NavigationStack` for navigation and injects the `ListViewModel` into the environment to manage task data.
///
/// - The app starts with `ListView` as the main screen.
/// - `SwiftDataService.shared` handles all data persistence.
/// - `ItemModel` is connected to SwiftData for storage.
///
/// ## Components
/// - `NavigationStack`: Provides navigation between views.
/// - `ListViewModel`: Manages task data (CRUD operations).
/// - `ItemModel`: Represents a task item.
///
/// ## Usage
/// The app automatically launches the `ListView` where users can view, add, and manage tasks.
///
@main
struct To_Do_ListApp: App {
    
    /// The main body of the app, defining the initial window and environment setup.
    var body: some Scene {
        
        /// The view model managing the list of tasks.
        @State var viewModel = ListViewModel(dataSource: SwiftDataService.shared)
        
        WindowGroup {
            NavigationStack {
                ListView()  // Displays the list of tasks
            }
            .environment(viewModel)          // Injects the view model into the environment
            .modelContainer(for: ItemModel.self)  // Enables data persistence with SwiftData
        }
    }
}
