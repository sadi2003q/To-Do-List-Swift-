//
//  SwiftDataService.swift
//  To Do List
//
//  Created by Sadi on 10/01/2025.
//

import Foundation
import SwiftData

/// A singleton service class responsible for managing data persistence in the To-Do List app.
///
/// `SwiftDataService` handles all data-related operations, including fetching, adding, updating, and deleting tasks
/// from the persistent storage using SwiftData's `ModelContainer` and `ModelContext`.
///
/// - Features:
///   - Persistent storage for tasks.
///   - CRUD operations (Create, Read, Update, Delete) for `ItemModel`.
///   - Singleton pattern for global data access.
///
class SwiftDataService {
    
    // MARK: - Properties
    
    /// The model container managing the data model and configuration.
    private let modelContainer: ModelContainer
    
    /// The main context for performing data operations.
    private let modelContext: ModelContext
    
    /// A shared singleton instance of `SwiftDataService`.
    ///
    /// This allows the data service to be accessed globally within the app.
    @MainActor
    static let shared = SwiftDataService()
    
    // MARK: - Initialization
    
    /// Initializes the `SwiftDataService` with a persistent data store.
    ///
    /// - Note: The `isStoredInMemoryOnly` flag is set to `false` to enable persistent storage across app launches.
    @MainActor
    private init() {
        self.modelContainer = try! ModelContainer(
            for: ItemModel.self,
            configurations: ModelConfiguration(isStoredInMemoryOnly: false)
        )
        self.modelContext = modelContainer.mainContext
    }
    
    // MARK: - CRUD Operations
    
    /// Fetches all tasks from persistent storage.
    ///
    /// - Returns: An array of `ItemModel` representing the current tasks.
    ///
    /// If fetching fails, the app will terminate and print the error.
    func FetchTask() -> [ItemModel] {
        do {
            return try modelContext.fetch(FetchDescriptor<ItemModel>())
        } catch {
            fatalError("Failed to fetch tasks: \(error.localizedDescription)")
        }
    }
    
    /// Adds a new task to persistent storage.
    ///
    /// - Parameter item: The `ItemModel` to be added.
    ///
    /// This method inserts a new task into the storage and saves the context.
    func AddTask(item: ItemModel) {
        modelContext.insert(item)
        do {
            try modelContext.save()
        } catch {
            fatalError("Failed to add task: \(error.localizedDescription)")
        }
    }
    
    /// Updates the completion status of a task in persistent storage.
    ///
    /// - Parameter item: The `ItemModel` to be updated.
    ///
    /// This method toggles the `isComplete` property of the task and saves the context.
    func UpdateTask(item: ItemModel) {
        item.isComplete.toggle()
        do {
            try modelContext.save()
        } catch {
            fatalError("Failed to update task: \(error.localizedDescription)")
        }
    }

    /// Deletes a task from persistent storage.
    ///
    /// - Parameter item: The `ItemModel` to be deleted.
    ///
    /// This method removes the task from the storage and saves the context.
    func DeleteTask(item: ItemModel) {
        modelContext.delete(item)
        do {
            try modelContext.save()
        } catch {
            fatalError("Failed to delete task: \(error.localizedDescription)")
        }
    }
}
