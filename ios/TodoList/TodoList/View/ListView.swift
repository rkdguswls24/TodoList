//
//  ListView.swift
//  TodoList
//
//  Created by 강현진 on 2/2/25.
//

import SwiftUI

struct ListView: View {
    
    @Environment(ListViewModel.self) var listViewModel
    
    var body: some View {
        ZStack {
            listSection
        }
        .navigationTitle("TodoList 💡")
        .toolbar {
            ToolbarItem(placement: .topBarLeading) {
                EditButton()
            }
            ToolbarItem(placement: .topBarTrailing) {
                NavigationLink {
                    AddView()
                } label: {
                    Image(systemName:"text.badge.plus")
                }
            }
        }
        
    }
    
    
    
}

#Preview {
    NavigationStack {
        ListView()
            
    }
    .environment(ListViewModel())
}

extension ListView {
    private var listSection: some View {
        List {
            
            ForEach(listViewModel.items) { item in
                ListRowView(item: item)
            }
            .onDelete(perform: listViewModel.deleteItem)
            .onMove(perform: listViewModel.moveItem)
            
        }
        .listStyle(.plain)
    }
    
    
}
