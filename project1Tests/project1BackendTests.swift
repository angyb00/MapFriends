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
        XCTAssertNil(BackendService.currentUsername)
    }
    
    func testLocations() {
        XCTAssertTrue(BackendService.getLocations().contains("London"))
        guard let sublocations = try? BackendService.getSublocations(at: "London") else {
            XCTFail("Couldn't find location London in locations list.")
            return
        }
        XCTAssertTrue(sublocations.contains("Big Ben"))
    }
    
    func testGroups() {
        BackendService.login(username: "Zakee K.", password: "asdf")
        XCTAssertNotNil(BackendService.currentUsername)
        
        guard let groups = try? BackendService.getGroups(at: "New York") else {
            XCTFail("Couldn't get groups for New York.")
            return
        }
        XCTAssertTrue(groups.contains("Joycon Boyz Memorial Group"))
        
        BackendService.joinGroup("Joycon Boyz Memorial Group")
        XCTAssertTrue(BackendService.currentUserGroups.contains("Joycon Boyz Memorial Group"))
        
        BackendService.leaveGroup("Joycon Boyz Memorial Group")
        XCTAssertFalse(BackendService.currentUserGroups.contains("Joycon Boyz Memorial Group"))
        
        BackendService.logout()
        XCTAssertNil(BackendService.currentUsername)
    }
    
    func testReviews() {
        BackendService.login(username: "Zakee K.", password: "asdf")
        XCTAssertNotNil(BackendService.currentUsername)
        
        do {
            let dr = try BackendService.getReviews(for: "Disneyland", at: "Los Angeles")
            XCTAssertTrue(dr.contains { $0.contains("Sora K. H.") })
            
            try BackendService.postReview(for: "Disneyland", at: "Los Angeles", text: "Zakee K. - The mouse sucks")
            
            let newDr = try BackendService.getReviews(for: "Disneyland", at: "Los Angeles")
            XCTAssertTrue(newDr.contains { $0.contains("Zakee K.") })
        } catch {
            XCTFail()
        }
        
        BackendService.logout()
        XCTAssertNil(BackendService.currentUsername)
    }
    
    func testFriends() {
        BackendService.login(username: "Zakee K.", password: "asdf")
        XCTAssertNotNil(BackendService.currentUsername)
        
        XCTAssertTrue(BackendService.getFriends().contains {$0 == "John Deer"})
        
        BackendService.addFriend("Swan S.")
        XCTAssertTrue(BackendService.getFriends().contains {$0 == "Swan S."})
        
        BackendService.removeFriend("Swan S.")
        XCTAssertFalse(BackendService.getFriends().contains {$0 == "Swan S."})
        
        BackendService.logout()
        XCTAssertNil(BackendService.currentUsername)
    }
}
