//
//  ListViewModel.swift
//  Phillip ToDo
//
//  Created by Phillip Shen on 18/9/21.
//

//This file is a reference sheet, in which I can put functions in here to keep other main files neat and tidy.

import Foundation


class ListViewModel: ObservableObject {
    @Published var items: [ItemModel] = [] {
        didSet{
            saveItems()
        }
    }
    
    let itemsKey: String = "items_list"
    
    init() {
        getItems()
    }
    
    func getItems() {
        guard
            let data = UserDefaults.standard.data(forKey: itemsKey),
            let savedItems = try? JSONDecoder().decode([ItemModel].self, from: data)
        else { return }
        
        self.items = savedItems
    }
    
    //Function for Deleting items
    func deleteItem(indexSet: IndexSet) {
        items.remove(atOffsets: indexSet)
    }
    //Function for moving items
    func moveItem(from: IndexSet, to: Int) {
        items.move(fromOffsets: from, toOffset: to)
    }
    
    //Logic for creaitng new item
    func addItem(title: String){
        let newItem = ItemModel(title: title, isCompleted: false)
        items.append(newItem)
    }
    //Updating Item
    func updateItem(item: ItemModel) {
        if let index = items.firstIndex(where: { $0.id == item.id}) {
            items[index] = item.updateCompletion()
        }
    } //Saving Item
    func saveItems(){
        if let encodedData = try? JSONEncoder().encode(items) {
            UserDefaults.standard.set(encodedData, forKey: itemsKey)
        }
    }
    
}
