//
//  ListViewModel.swift
//  TodoList
//
//  Created by 강현진 on 2/2/25.
//

import Foundation

@Observable class ListViewModel {
    var items:[ItemModel] = []{
        didSet {
            saveItems()
        }
    }
    var manager = LocalFileManager.shared
    
    
    init() {
        getItems()
    }
    
    func getItems(){
        items = LocalFileManager.shared.loadData()
        
    }
    
    func saveItems() {
        LocalFileManager.shared.saveData(items: items)
        
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
    func addItem(title:String,content:String){
        let item = ItemModel(title: title, isCompleted: false,content:content)
        items.append(item)
    }
    func updateItem(item:ItemModel) {
        if let index = items.firstIndex(where: { $0.id == item.id}) {
            items[index] = item.toggleCompletion()
        }
        
    }
    //update title,content in detail view
    func updateItem(item:ItemModel,title:String,content:String) {
        if let index = items.firstIndex(where: { $0.id == item.id}) {
            items[index] = item.updateCompletion(title: title,content: content)
        }
        
    }
    
}
