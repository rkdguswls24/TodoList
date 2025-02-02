//
//  ListViewModel.swift
//  TodoList
//
//  Created by 강현진 on 2/2/25.
//

import Foundation

@Observable class ListViewModel {
    var items:[ItemModel]
    
    init() {
        items = [
            ItemModel(title: "hello1", isCompleted: true),
            ItemModel(title: "hello2", isCompleted: false),
            ItemModel(title: "hello3", isCompleted: true),
            ItemModel(title: "hello4", isCompleted: false),
        ]
    }
    
    func deleteItem (indexSet: IndexSet) {
        items.remove(atOffsets: indexSet)
    }
    
    func moveItem(from:IndexSet,to:Int){
        items.move(fromOffsets: from, toOffset: to)
    }
    
    func addItem(title:String){
        let item = ItemModel(title: title, isCompleted: false)
        items.append(item)
    }
}
