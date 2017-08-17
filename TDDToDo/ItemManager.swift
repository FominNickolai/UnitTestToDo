//
//  ItemManager.swift
//  TDDToDo
//
//  Created by Fomin Mykola on 8/17/17.
//  Copyright © 2017 Fomin Mykola. All rights reserved.
//

import Foundation

class ItemManager {
    
    var toDoCount: Int {
        return toDoItems.count
    }
    var doneCount: Int {
        return doneItems.count
    }
    private var toDoItems: [ToDoItem] = []
    private var doneItems: [ToDoItem] = []
    
    func add(_ item: ToDoItem) {
        toDoItems.append(item)
    }
    
    func item(at index: Int) -> ToDoItem {
        return toDoItems[index]
    }
    
    func checkItem(at index: Int) {
        let item = toDoItems.remove(at: index)
        doneItems.append(item)
    }
    
    func doneItem(at index: Int) -> ToDoItem{
        return doneItems[index]
    }
}
