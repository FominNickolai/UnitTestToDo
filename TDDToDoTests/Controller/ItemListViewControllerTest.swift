//
//  ItemListViewControllerTest.swift
//  TDDToDo
//
//  Created by Fomin Mykola on 8/17/17.
//  Copyright © 2017 Fomin Mykola. All rights reserved.
//

import XCTest
@testable import TDDToDo

class ItemListViewControllerTest: XCTestCase {
    
    var sut: ItemListViewController!
    
    override func setUp() {
        super.setUp()
        let storyBoard = UIStoryboard(name: "Main", bundle: nil)
        let viewController = storyBoard.instantiateViewController(withIdentifier: "ItemListViewController")
        sut = viewController as! ItemListViewController
        _ = sut.view//trigger call viewDidLoad() in viewController
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func test_TableViewIsNotNilAfterViewDidLoad() {
        
        XCTAssertNotNil(sut.tableView)
    }
    
    func test_LoadingView_IsSetsTableViewDataSource() {
        
        XCTAssertTrue(sut.tableView.dataSource is ItemListDataProvider)
    }
    
    func test_LoadingView_IsSetsDataSourceAndDelegateToTheSameObject() {
        XCTAssertEqual(sut.tableView.dataSource as? ItemListDataProvider, sut.tableView.delegate as? ItemListDataProvider)
    }
    
}
