//
//  Untitled.swift
//  To Do List
//
//  Created by  Sadi on 09/01/2025.
//

import Foundation
import SwiftData

/*
 @Observable
 class ListViewModel {
 
 var items: [ItemModel] = []
 
 
 init () {
 getItems()
 }
 
 
 func getItems () {
 let newItem : [ItemModel] = [
 ItemModel(title:  "this is the first title", isComplete: true),
 ItemModel(title: "this is the second title", isComplete: false),
 ItemModel(title: "this is the third title", isComplete: true)
 ]
 
 items.append(contentsOf: newItem)
 }
 
 func onDelete(indexSet: IndexSet) {
 items.remove(atOffsets: indexSet)
 }
 
 func onMove(indexSet: IndexSet, newOffset: Int) {
 items.move(fromOffsets: indexSet, toOffset: newOffset)
 }
 
 func addItem(title: String) {
 let item = ItemModel(title: title, isComplete: false)
 items.append(item)
 }
 
 func updateItem(item: ItemModel) {
 //        if let index = items.firstIndex { currentItem in
 //            return currentItem.id == item.id
 //        }
 
 if let index = items.firstIndex(where: {$0.id == item.id}){
 items[index] = item.updateCompletion()
 
 }
 }
 
 
 }
 */

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

