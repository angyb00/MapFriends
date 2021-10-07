//
//  project1BackendTests.swift
//  project1UITests
//
//  Created by Zakee Khattak on 10/7/21.
//

import Foundation
import XCTest
@testable import project1
import SwiftUI

class project1BackendTests : XCTestCase {
    func testLoginLogout() {
        BackendService.login(username: "Zakee K.", password: "asdf")
        XCTAssertEqual(BackendService.currentUsername, "Zakee K.")
        BackendService.logout()
        XCTAssertEqual(BackendService.currentUsername, nil)
    }
    
    func testLocations() {
        XCTAssertTrue(BackendService.getLocations().contains("London"))
        XCTAssertTrue(BackendService.getSublocations(at: "London").contains("Big Ben"))
    }
    
    func testGroups() {
        BackendService.login(username: "Zakee K.", password: "asdf")
        XCTAssertNotEqual(BackendService.currentUsername, nil)
        
        XCTAssertTrue(BackendService.getGroups(at: "New York").contains("Joycon Boyz Memorial Group"))
        
        BackendService.joinGroup("Joycon Boyz Memorial Group")
        XCTAssertTrue(BackendService.currentUserGroups.contains("Joycon Boyz Memorial Group"))
        
        BackendService.leaveGroup("Joycon Boyz Memorial Group")
        XCTAssertFalse(BackendService.currentUserGroups.contains("Joycon Boyz Memorial Group"))
        
        BackendService.logout()
        XCTAssertEqual(BackendService.currentUsername, nil)
    }
    
    func testReviews() {
        BackendService.login(username: "Zakee K.", password: "asdf")
        XCTAssertNotEqual(BackendService.currentUsername, nil)
        
        let dr = BackendService.getReviews(for: "Disneyland", at: "Los Angeles")
        XCTAssertTrue(dr.contains(where: {(x) -> Bool in
            x.contains("Sora K. H.")
        }))
        
        BackendService.postReview(for: "Disneyland", at: "Los Angeles", text: "Zakee K. - The mouse sucks")
        
        let newDr = BackendService.getReviews(for: "Disneyland", at: "Los Angeles")
        XCTAssertTrue(newDr.contains(where: {(x) -> Bool in
            x.contains("Zakee K.")
        }))
        
        BackendService.logout()
        XCTAssertEqual(BackendService.currentUsername, nil)
    }
}
