//
//  ListRowView.swift
//  TodoList
//
//  Created by 강현진 on 2/2/25.
//

import SwiftUI

struct ListRowView: View {
    
    @Environment(ListViewModel.self) var listViewModel
    
    var item: ItemModel
    
    var body: some View {
        HStack(spacing:8) {
            
            Image(systemName:item.isCompleted ? "checkmark.square" : "square")
                .foregroundStyle(item.isCompleted ? Color.green : Color.red)
                .padding()
                .onTapGesture {
                    withAnimation {
                        listViewModel.updateItem(item: item)
                    }
                }
            NavigationLink {
                DetailView(item: item)
            } label: {
                Text(item.title)
                    .frame(maxWidth:.infinity,alignment: .leading)
                    
            }            
            Spacer()
        }
        .font(.title3)
        .padding(.vertical, 8)
        
    }
}

#Preview {
    NavigationStack {
        ListRowView(item: ItemModel(title: "hello1", isCompleted: true))
            .environment(ListViewModel())
    }
}


