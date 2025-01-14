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
/// `To_Do_ListApp`is a basic Application which allow user to add Task, Update and delete task. It is a very basic Beginner application on swiftUI.
/// It uses a `SwiftData`for storing all the data uses custom container for maintaining **MVVM**  architecture. `ListViewModel` into the environment to manage task data.
///
/// - The app starts with `ListView` as the main screen.
/// - `SwiftDataService.shared` handles all data persistence.
/// - `ItemModel` is connected to SwiftData for storage.
///
/// ## Important Components
/// - `SwiftData`: SwiftData is a modern framework for managing data in Swift applications. It provides a seamless way to define, store, and retrieve data models, ensuring data persistence. In this application, SwiftData is crucial for managing and storing the tasks, enabling CRUD operations to be performed on the task list.
///
/// ## Usage
/// - Add Task
/// - Delete Task
/// - Update task
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
