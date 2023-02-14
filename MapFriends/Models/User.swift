//
//  User.swift
//  MapFriends
//
//  Created by Angarag Gansukh on 2/12/23.
//

import Foundation
import FirebaseFirestore
import Firebase


struct User: Identifiable{
    
    var id = UUID()
    var firstName: String
    var lastName: String
    var userID: String
    
    init?(data: [String:Any]){
        if let userID = data["userID"] as? String, let firstName = data["firstName"] as? String, let lastName = data["lastName"] as? String {
            self.firstName = firstName
            self.lastName = lastName
            self.userID = userID
        }
        
        else { return nil }
        
    }
    
    
    
}
