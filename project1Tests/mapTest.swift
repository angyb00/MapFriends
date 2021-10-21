//
//  mapTest.swift
//  project1Tests
//
//  Created by Brandon Papin on 10/20/21.
//

import XCTest
import MapKit
@testable import project1


class mapTest: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func testLatitude() {
        let coordinate = DashBoardView(latitude: 6.0, longitude: -5.0)
      // then
        XCTAssertEqual(coordinate.latitude, 6.0, "Latitude successfully added")
    }
    
    func testLongitude() {
        let coordinate = DashBoardView(latitude: 6.0, longitude: -5.0)
      // then
        XCTAssertEqual(coordinate.longitude, -5.0, "Longitude successfully added")
    }
    
    func testMapDisplay() {
        let map = MapView(coordinate: CLLocationCoordinate2D(latitude: 0.0, longitude: 0.0))
      // then
        XCTAssertEqual(map.coordinate, CLLocationCoordinate2D(latitude: 0.0, longitude: 0.0), "Longitude successfully added")
      
    }

}
