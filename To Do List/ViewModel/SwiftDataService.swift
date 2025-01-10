//
//  SwiftDataService.swift
//  To Do List
//
//  Created by  Sadi on 10/01/2025.
//

import Foundation
import SwiftData

class SwiftDataService {
    private let modelContainer: ModelContainer
    private let modelContext: ModelContext
    
    @MainActor
    static let shared = SwiftDataService()
    
    @MainActor
    private init() {
        // Change isStoredInMemoryOnly to false if you would like to see the data persistance after kill/exit the app
        self.modelContainer = try! ModelContainer(for: ItemModel.self, configurations: ModelConfiguration(isStoredInMemoryOnly: false))
        self.modelContext = modelContainer.mainContext
    }
    
    func FetchTask() -> [ItemModel] {
        do {
            return try modelContext.fetch(FetchDescriptor<ItemModel>())
        } catch {
            fatalError(error.localizedDescription)
        }
    }
    
    func AddTask(item: ItemModel) {
        modelContext.insert(item)
        do {
            try modelContext.save()
        } catch {
            fatalError(error.localizedDescription)
        }
    }
    
    func UpdateTask(item: ItemModel) {
        item.isComplete.toggle()
        
        do {
            try modelContext.save()
        } catch {
            fatalError("Failed to update student: \(error.localizedDescription)")
        }
    }

    func DeleteTask(item: ItemModel) {
        modelContext.delete(item)
        do {
            try modelContext.save()
        } catch {
            fatalError("Failed to delete student: \(error.localizedDescription)")
        }
    }
}
