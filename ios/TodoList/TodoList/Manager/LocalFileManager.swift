//
//  LocalFileManager.swift
//  TodoList
//
//  Created by 강현진 on 2/3/25.
//

import Foundation


class LocalFileManager {
    static let shared = LocalFileManager()
    private let fileName = "todolistitems.json"
    
    private init() {
        
    }
    
    private func getFilePath() -> URL {
        let directory = FileManager
            .default
            .urls(for: .documentDirectory, in: .userDomainMask)
            .first!
        
        return directory.appending(path: fileName)
    }

    func saveData(items:[ItemModel]){
        
        let fileUrl = getFilePath()

        do{
            let jsonData = try JSONEncoder().encode(items)
            try jsonData.write(to: fileUrl, options: .atomic)
            
        }catch(let error){
            print("Error while saving data: \(error)")
        }
        
        
    }
    
    func loadData() -> [ItemModel] {
        let fileUrl = getFilePath()
        
        guard FileManager.default.fileExists(atPath: fileUrl.path()) else {
            return []
        }
        
        do{
            let data = try Data(contentsOf: fileUrl)
            return try JSONDecoder().decode([ItemModel].self, from:data)
        }catch {
            print("error while gettting data from path")
            return []
        }
    }
}
