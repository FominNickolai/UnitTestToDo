//
//  ItemListDataProvider.swift
//  TDDToDo
//
//  Created by Fomin Mykola on 8/18/17.
//  Copyright © 2017 Fomin Mykola. All rights reserved.
//

import UIKit

enum Section: Int {
    case ToDo
    case Done
}

class ItemListDataProvider: NSObject {
    var itemManager: ItemManager?
}

extension ItemListDataProvider: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        guard let itemManager = itemManager else { return 0 }
        guard let itemSection = Section(rawValue: section) else { fatalError() }
        
        let numbersOfRows: Int
        switch itemSection {
        case .ToDo:
            numbersOfRows = itemManager.toDoCount
        case .Done:
            numbersOfRows = itemManager.doneCount
        }
        
        return numbersOfRows
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(
                            withIdentifier: "ItemCell",
                            for: indexPath) as! ItemCell
        
        guard let itemManager = itemManager else { fatalError() }
        guard let section = Section(rawValue: indexPath.section) else { fatalError() }
        
        let item: ToDoItem
        switch section {
        case .ToDo:
            item = itemManager.item(at: indexPath.row)
        case .Done:
            item = itemManager.doneItem(at: indexPath.row)
        }
        
        cell.configureCell(with: item)
        
        return cell
    }
    
}

extension ItemListDataProvider: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, titleForDeleteConfirmationButtonForRowAt indexPath: IndexPath) -> String? {
        
        guard let section = Section(rawValue: indexPath.section) else { return nil }
        
        let buttonTitle: String
        
        switch section {
        case .ToDo:
            buttonTitle = "Check"
        case .Done:
            buttonTitle = "Uncheck"
        }
        
        return buttonTitle
        
    }
    
}
















