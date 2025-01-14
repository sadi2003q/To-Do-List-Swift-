//
//  ListViewModel.swift
//  To Do List
//
//  Created by Sadi on 09/01/2025.
//

import Foundation
import SwiftData

/// The view model responsible for managing the state and logic of the To-Do List.
///
/// `ListViewModel` acts as a bridge between the user interface and the data layer, handling operations like
/// adding, updating, deleting, and reordering tasks. It fetches and updates data through the `SwiftDataService`.
///
/// - Features:
///   - Manages a dynamic list of tasks.
///   - Provides methods to add, update, delete, and reorder tasks.
///   - Automatically updates the task list after any modification.
///
@Observable
class ListViewModel {
    
    /// The list of tasks displayed in the UI.
    var items: [ItemModel] = []
    
    /// The data service responsible for performing CRUD operations on tasks.
    private let dataSource: SwiftDataService
    
    // MARK: - Initialization
    
    /// Initializes the `ListViewModel` with a provided data service.
    ///
    /// - Parameter dataSource: An instance of `SwiftDataService` used to manage task data.
    init(dataSource: SwiftDataService) {
        self.dataSource = dataSource
        items = dataSource.FetchTask()
    }
    
    // MARK: - CRUD Operations
    
    /// Adds a new task to the list with the given title.
    ///
    /// - Parameter title: The title of the new task.
    ///
    /// This method creates a new task with `isComplete` set to `false`, adds it to the data source,
    /// and refreshes the `items` list.
    func addItem(title: String) {
        let item = ItemModel(title: title, isComplete: false)
        dataSource.AddTask(item: item)
        items = dataSource.FetchTask()
    }
    
    /// Updates the completion status of an existing task.
    ///
    /// - Parameter item: The `ItemModel` object to be updated.
    ///
    /// This method updates the task in the data source and refreshes the `items` list.
    func updateItem(item: ItemModel) {
        dataSource.UpdateTask(item: item)
        items = dataSource.FetchTask()
    }
    
    /// Deletes tasks at the specified index positions.
    ///
    /// - Parameter index: The `IndexSet` of tasks to delete.
    ///
    /// This method removes tasks from the data source and updates the `items` list.
    func onDelete(index: IndexSet) {
        index.forEach { i in
            let item = items[i]
            dataSource.DeleteTask(item: item)
        }
        items.remove(atOffsets: index)
    }
    
    /// Moves tasks from one position to another in the list.
    ///
    /// - Parameters:
    ///   - indexSet: The original positions of the items to move.
    ///   - newOffset: The new position to move the items to.
    ///
    /// This method only updates the order in the UI; the data source remains unchanged.
    func onMove(indexSet: IndexSet, newOffset: Int) {
        items.move(fromOffsets: indexSet, toOffset: newOffset)
    }
}
