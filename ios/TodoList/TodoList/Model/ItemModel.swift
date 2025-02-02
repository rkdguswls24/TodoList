//
//  ItemModel.swift
//  TodoList
//
//  Created by 강현진 on 2/2/25.
//

import Foundation

struct ItemModel: Identifiable {
    let id = UUID().uuidString
    let title: String
    let isCompleted: Bool
}
