//
//  itemModel.swift
//  To Do List
//
//  Created by  Sadi on 09/01/2025.
//

import Foundation



struct ItemModel : Identifiable {
    let id: String
    let title: String
    let isComplete: Bool
    
    init(id:String = UUID().uuidString, title: String, isComplete: Bool) {
        self.id = id
        self.title = title
        self.isComplete = isComplete
    }
    
    func updateCompletion() -> ItemModel {
        return ItemModel(id: id, title: title, isComplete: !isComplete)
    }
    
}

enum Error: LocalizedError {
    case inappropropriateInput
    
    var errorDescription: String? {
        switch self {
        case .inappropropriateInput:
            return "Inappropriate Input"
        }
    }
    
    var failureReason: String? {
        switch self {
        case .inappropropriateInput:
            return "Input should be more then 4 characters. Try with a longer Task💀👹🥹"
        }
    }
    
    
}

