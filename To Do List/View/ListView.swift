//
//  ListView.swift
//  To Do List
//
//  Created by  Sadi on 09/01/2025.
//

import SwiftUI

struct ListView: View {
    
    
    @Environment(ListViewModel.self) private var viewModel
    
    
       
    
    var body: some View {
        List {
            TaskView
        }
        .listStyle(.plain)
        .navigationTitle("To Do List 📝")
        .toolbar {
            
            ToolbarItem(placement: .topBarLeading) {
                EditButton()
            }
            
            ToolbarItem(placement: .topBarTrailing) {
                NavigationLink_AddView
            }
        }
        
    }
    
    
    private var TaskView: some View {
        
        ForEach(viewModel.items, id: \.id) { item in
            ListRowView(item: item)
                .onTapGesture {
                    withAnimation(.spring(duration: 0.3)) {
                        viewModel.updateItem(item: item)
                    }
                }
        }
        .onMove (perform: viewModel.onMove)
        .onDelete (perform: viewModel.onDelete)
        
        
    }
    
    private var NavigationLink_AddView: some View {
        NavigationLink("Add") {
            AddView()
        }
    }
    
    
    
}

#Preview {
    NavigationStack {
        ListView()
    }
    .environment(ListViewModel())
    
}