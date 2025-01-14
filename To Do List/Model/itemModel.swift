//
//  itemModel.swift
//  To Do List
//
//  Created by  Sadi on 09/01/2025.
//

import Foundation
import SwiftData

/// A model representing an item with a title and completion status.
///
/// `ItemModel` is used to store and manage items, such as tasks in a to-do list.
/// It includes a unique identifier, a title, and a completion status.
///
/// - Features:
///   - Unique identifier (`id`) for each item.
///   - Title to describe the Task.
///   - Completion status (`isComplete`) to track if the Task is done.
///   - A method to toggle the completion status.
@Model
class ItemModel: Identifiable {
    
    /// A unique identifier for the item.
    public var id: String
    
    /// The title or description of the item.
    public var title: String
    
    /// A Boolean value indicating whether the item is completed.
    public var isComplete: Bool
    
    /// Creates a new `ItemModel` instance.
    ///
    /// - Parameters:
    ///   - id: A unique identifier for the item. Defaults to a new UUID string.
    ///   - title: The title or Task.
    ///   - isComplete: The completion status of the Task.
    public init(id: String = UUID().uuidString, title: String, isComplete: Bool) {
        self.id = id
        self.title = title
        self.isComplete = isComplete
    }
    
    /// Toggles the completion status of the item.
    ///
    /// - Returns: A new `ItemModel` instance with the `isComplete` status flipped.
    ///
    /// Example:
    /// ```swift
    /// let item = ItemModel(title: "Buy groceries", isComplete: false)
    /// let updatedItem = item.updateCompletion()
    /// print(updatedItem.isComplete) // true
    /// ```
    public func updateCompletion() -> ItemModel {
        return ItemModel(id: id, title: title, isComplete: !isComplete)
    }
}


/// An error type representing possible input validation failures.
///
/// The `Error` enum is used to handle specific errors related to user input, particularly when the input doesn't meet certain criteria.
///
/// - Note: This enum conforms to `LocalizedError` to provide user-friendly error descriptions.
enum Error: LocalizedError {
    
    /// Indicates that the provided input is inappropriate or invalid.
    case inappropropriateInput
    
    /// A localised message describing what error occurred.
    ///
    /// Provides a brief description of the error for user-facing error messages.
    ///
    /// - Example:
    /// ```swift
    /// let error: Error = .inappropropriateInput
    /// print(error.errorDescription ?? "Unknown error")  // Output: "Inappropriate Input"
    /// ```
    var errorDescription: String? {
        switch self {
        case .inappropropriateInput:
            return "Inappropriate Input"
        }
    }
    
    /// A localised message explaining why the error occurred.
    ///
    /// Provides a detailed reason for the error, helping users understand what went wrong.
    ///
    /// - Example:
    /// ```swift
    /// let error: Error = .inappropropriateInput
    /// print(error.failureReason ?? "No reason provided")
    /// // Output: "Input should be more than 4 characters. Try with a longer Task💀👹🥹"
    /// ```
    var failureReason: String? {
        switch self {
        case .inappropropriateInput:
            return "Input should be more than 4 characters. Try with a longer Task💀👹🥹"
        }
    }
}
