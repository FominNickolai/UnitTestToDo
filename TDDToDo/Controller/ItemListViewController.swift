//
//  ItemListViewController.swift
//  TDDToDo
//
//  Created by Fomin Mykola on 8/17/17.
//  Copyright © 2017 Fomin Mykola. All rights reserved.
//

import UIKit

class ItemListViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var dataProvider: (UITableViewDataSource & UITableViewDelegate)!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.dataSource = dataProvider
        tableView.delegate = dataProvider
    }

    

}
