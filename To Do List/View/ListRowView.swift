//
//  ListRowView.swift
//  To Do List
//
//  Created by Sadi on 09/01/2025.
//

import SwiftUI

/// A view that represents a single row in the to-do list.
///
/// `ListRowView` displays a task with a completion indicator and its title.
/// It visually distinguishes between completed and pending tasks using system icons and colors.
///
/// - Features:
///   - A checkmark or circle icon to indicate task completion.
///   - Dynamic color styling based on task status (green for completed, red for pending).
///   - A clean and simple horizontal layout.
struct ListRowView: View {
    
    /// The task item to be displayed in the row.
    let item: ItemModel
    
    var body: some View {
        HStack {
            /// An icon that reflects the completion status of the task.
            Image(systemName: item.isComplete ? "checkmark.circle" : "circle")
                .foregroundStyle(item.isComplete ? .green : .red)
            
            /// The title of the task.
            Text("\(item.title)")
                .font(.body)
                .foregroundStyle(.primary)
        }
        .padding(.vertical, 8)
    }
}

#Preview(traits: .sizeThatFitsLayout) {
    // Sample items for previewing the ListRowView in both completed and incomplete states.
    let itemModel_1: ItemModel = ItemModel(title: "This is a demo task (Incomplete)", isComplete: false)
    let itemModel_2: ItemModel = ItemModel(title: "This is a demo task (Complete)", isComplete: true)
    
    // Display both task states in the preview.
    Group {
        ListRowView(item: itemModel_1)
        ListRowView(item: itemModel_2)
    }
}
