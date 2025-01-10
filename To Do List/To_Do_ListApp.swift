//
//  To_Do_ListApp.swift
//  To Do List
//
//  Created by  Sadi on 09/01/2025.
//

import SwiftUI

@main
struct To_Do_ListApp: App {
    var body: some Scene {
        
        //@State var viewModel: ListViewModel = ListViewModel()
        
        @State var viewModel = ListViewModel()
        
        WindowGroup {
            NavigationStack {
                ListView()
                    .environment(viewModel)
            }
            
            
        }
        
    }
}
