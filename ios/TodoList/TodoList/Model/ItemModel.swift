//
//  ItemModel.swift
//  TodoList
//
//  Created by 강현진 on 2/2/25.
//

import Foundation

struct ItemModel: Identifiable,Codable {
    let id:String
    let title: String
    let isCompleted: Bool
    let content: String
    
    init(id:String = UUID().uuidString,title: String, isCompleted: Bool,content:String = "") {
        self.id = id
        self.title = title
        self.isCompleted = isCompleted
        self.content = content
    }
    
    func toggleCompletion() -> ItemModel {
        //Completed.toggle()
        return ItemModel(id: id, title: title, isCompleted: !isCompleted,content: content)
    }
    
    func updateCompletion(title:String, content:String) -> ItemModel {
        //update title, content
        return ItemModel(id: id, title: title, isCompleted: isCompleted,content: content)
    }
    
    
}
