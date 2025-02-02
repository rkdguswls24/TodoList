//
//  TodoListApp.swift
//  TodoList
//
//  Created by 강현진 on 2/2/25.
//

import SwiftUI

@main
struct TodoListApp: App {
    
    @State var listViewModel:ListViewModel = ListViewModel()
    
    var body: some Scene {
        WindowGroup {
            NavigationStack {
                ListView()
                    
            }
           
            
        }
        .environment(listViewModel)
    }
}
