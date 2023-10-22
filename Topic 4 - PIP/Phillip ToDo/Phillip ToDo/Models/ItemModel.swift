//
//  ItemModel.swift
//  Phillip ToDo
//
//  Created by Phillip Shen on 9/9/21.
//

import Foundation

struct ItemModel: Identifiable, Codable {
    let id: String
    let title: String
    let isCompleted: Bool
    
    //This code allows us to initialise a ItemModel with a String or without a String
    init(id: String = UUID().uuidString, title: String, isCompleted: Bool){
        self.id = id
        self.title = title
        self.isCompleted = isCompleted
    }
    
    func updateCompletion() -> ItemModel{
        return ItemModel(id: id, title: title, isCompleted: !isCompleted)
    }
}
