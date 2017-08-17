//
//  LocationTests.swift
//  TDDToDo
//
//  Created by Fomin Mykola on 8/17/17.
//  Copyright © 2017 Fomin Mykola. All rights reserved.
//

import XCTest
@testable import TDDToDo
import CoreLocation

class LocationTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func test_Init_WhenGivenCoordinate_SetsCoordinate() {
        
        let coordinate = CLLocationCoordinate2D(latitude: 1, longitude: 2)
        let location = Location(name: "", coordinate: coordinate)
        
        XCTAssertEqual(location.coordinate?.latitude, coordinate.latitude)
        XCTAssertEqual(location.coordinate?.longitude, coordinate.longitude)
        
        
    }
    
    func test_Init_WhenGivenName_SetsName() {
        let location = Location(name: "Foo")
        XCTAssertEqual(location.name, "Foo")
    }
    
    func test_EqualLocations_AreEqual() {
        let first = Location(name: "Foo")
        let second = Location(name: "Foo")
        XCTAssertEqual(first, second)
    }
    
    func performNotEqualTestWith(firstName: String, secondName: String, firstLongLat: (Double, Double)?, secondLongLat: (Double, Double)?, line: UInt = #line) {
        
        var firstCoord: CLLocationCoordinate2D? = nil
        
        if let firstLongLat = firstLongLat {
            firstCoord = CLLocationCoordinate2D(latitude: firstLongLat.0, longitude: firstLongLat.1)
        }
        let firstLocation = Location(name: firstName, coordinate: firstCoord)
        
        var secondCoord: CLLocationCoordinate2D? = nil
        
        if let secondLongLat = secondLongLat {
            secondCoord = CLLocationCoordinate2D(latitude: secondLongLat.0, longitude: secondLongLat.1)
        }
        let secondLocation = Location(name: secondName, coordinate: secondCoord)
        
        XCTAssertNotEqual(firstLocation, secondLocation, line: line)
    }
    
    func test_Locations_WhenLatitudeDiffers_AreNotEqual() {
        
        let first = Location(name: "Foo", coordinate: CLLocationCoordinate2D(latitude: 1.0, longitude: 0.0))
        let second = Location(name: "Foo", coordinate: CLLocationCoordinate2D(latitude: 0.0, longitude: 0.0))
        
        XCTAssertNotEqual(first, second)
        
    }
    
    func test_Locations_WhenLongitudeDiffers_AreNotEqual() {
        
        let first = Location(name: "Foo", coordinate: CLLocationCoordinate2D(latitude: 0.0, longitude: 0.0))
        let second = Location(name: "Foo", coordinate: CLLocationCoordinate2D(latitude: 0.0, longitude: 1.0))
        
        XCTAssertNotEqual(first, second)
        
    }
    
    func test_Locations_WhenNamesDiffer_AreNotEqual() {
        performNotEqualTestWith(firstName: "Foo", secondName: "Bar", firstLongLat: nil, secondLongLat: nil)
    }
    
    
}
