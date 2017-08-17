//
//  ToDoItem.swift
//  TDDToDo
//
//  Created by Fomin Mykola on 8/17/17.
//  Copyright © 2017 Fomin Mykola. All rights reserved.
//

import Foundation

struct ToDoItem {
    let title: String
    let itemDescription: String?
    let timestamp: Double?
    let location: Location?
    
    init(title: String, itemDescription: String? = nil, timestamp: Double? = nil, location: Location? = nil) {
        self.title = title
        self.itemDescription = itemDescription
        self.timestamp = timestamp
        self.location = location
    }
    
}

extension ToDoItem: Equatable {
    static func == (lhs: ToDoItem, rhs: ToDoItem) -> Bool {
        return
            lhs.title == rhs.title &&
            lhs.location == rhs.location &&
            lhs.timestamp == rhs.timestamp &&
            lhs.itemDescription == rhs.itemDescription
    }
}
