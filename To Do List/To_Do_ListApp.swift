//
//  To_Do_ListApp.swift
//  To Do List
//
//  Created by  Sadi on 09/01/2025.
//

import SwiftUI
import SwiftData

@main
struct To_Do_ListApp: App {
    var body: some Scene {
        
        //@State var viewModel: ListViewModel = ListViewModel()
        
        @State var viewModel = ListViewModel(dataSource: SwiftDataService.shared)
        
        WindowGroup {
            NavigationStack {
                ListView()
                    .environment(viewModel)
            }
            .modelContainer(for: ItemModel.self)
           
            
        }
        
    }
}
