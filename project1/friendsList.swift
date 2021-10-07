//
//  friendsList.swift
//  project1
//
//  Created by oyunbat tovuudorj on 10/7/21.
//

import Foundation
import SwiftUI

struct friendsList {
    var images: [String] = []
    
    var friends: [String] = ["Alice Wonderland", "John Doe", "Mike Wazowski"]
    
    mutating func addFriend(add name: String) {
        friends.append(name)
    }
    
    mutating func removeFriend(remove name: String) {
        // Remove from list
        friends.removeAll(where: { $0 == name })
    }
    
    func getInfo() {}
    
    
    func displayIcon() {}
}
