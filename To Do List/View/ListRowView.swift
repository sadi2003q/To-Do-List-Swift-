//
//  ListRowView.swift
//  To Do List
//
//  Created by  Sadi on 09/01/2025.
//

import SwiftUI

struct ListRowView: View {
    
    let item: ItemModel
    
    var body: some View {
        HStack {
            Image(systemName: item.isComplete ? "checkmark.circle" : "circle")
                .foregroundStyle(item.isComplete ? .green : .red)
            Text("\(item.title)")
            
        }
    }
}

/*#Preview(traits: .sizeThatFitsLayout)*/
#Preview(traits: .sizeThatFitsLayout) {
    let itemModel_1: ItemModel = ItemModel(title: "this is Demo title_1", isComplete: false)
    
    let itemModel_2: ItemModel = ItemModel(title: "this is Demo title_2", isComplete: true)
    Group {
        ListRowView(item: itemModel_1)
        ListRowView(item: itemModel_2)
    }
    
    
    
}
/*
 #Preview(traits: .sizeThatFitsLayout) {
     ContentView()
 }
 */
