//
//  project1Tests.swift
//  project1Tests
//
//  Created by Zakee Khattak on 9/16/21.
//

import XCTest
@testable import project1

class project1Tests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
    func testFriendsList(){
        
        var list = friendsList()
        XCTAssertEqual(list.friends.contains("Mike Wazowski"), true)
        list.removeFriend(remove: "Mike Wazowski")
        XCTAssertEqual(list.friends.contains("Mike Wazowski"), false)
        list.addFriend(add: "Rick James")
        XCTAssertEqual(list.friends.contains("Rick James"), true)
    }
    
    func testSettings(){
        var setting = settings()
        
        setting.darkMode = true
        XCTAssertEqual(setting.darkMode, true)
        
    }

}
