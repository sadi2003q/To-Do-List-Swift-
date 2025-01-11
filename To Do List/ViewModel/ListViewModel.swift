//
//  Untitled.swift
//  To Do List
//
//  Created by  Sadi on 09/01/2025.
//

import Foundation
import SwiftData

@Observable
class ListViewModel {
    var items: [ItemModel] = []
    
    private let dataSource: SwiftDataService
    
    init(dataSource: SwiftDataService) {
        self.dataSource = dataSource
        items = dataSource.FetchTask()
    }
    
    func addItem(title: String) {
        let item = ItemModel(title: title, isComplete: false)
        dataSource.AddTask(item: item)
        items = dataSource.FetchTask()
    }
    
    func updateItem(item: ItemModel) {
        
        dataSource.UpdateTask(item: item)
        items = dataSource.FetchTask()
        
    }
    
    
    func onDelete(index: IndexSet) {
        index.forEach { i in
            let item = items[i]
            dataSource.DeleteTask(item: item)
        }
        items.remove(atOffsets: index)
        
    }
    
    func onMove(indexSet: IndexSet, newOffset: Int) {
        items.move(fromOffsets: indexSet, toOffset: newOffset)
    }
    
}

