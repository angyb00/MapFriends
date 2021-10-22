//
//  loginAuth.swift
//  project1
//
//  Created by Joji on 9/21/21.
//

import Foundation
import Combine

//not sure about this yet but we will need some sort of file with
//master passwords that will either have hardcoded values for select
//users, or we will need some other form of storing these values
//once the password criteria is met

final class LoginAuth: NSObject, ObservableObject {
    let defualtUsername = "testing"
    let defualtPassword = "12345678"
    
    @Published var isLoggedin : Bool = false
    
    private override init() { }
    
    static let sharedInstance = LoginAuth()
    
    func attemptLogin(userName: String, password: String) {
        //check to see if the username and password provided meet
        //criteria with some hardcoded values we will prove in the future
        //until we figure out a solution for storing these
        let validUserName = isValidUserName(userName)
        let validPassword = isValidPassword(password)
        if (validUserName && validPassword) {
            let userDefaults = UserDefaults.standard
            userDefaults.set(true, forKey: "loggedIn")
            userDefaults.synchronize()
            self.isLoggedin = true
        }
    }
    
    func isValidUserName(_ userName: String) -> Bool {
      let minUsernameLength = 6
        return userName.count >= minUsernameLength && userName == defualtUsername
    }
      
    func isValidPassword(_ password: String) -> Bool {
        let minPasswordLength = 8
        return password.count >= minPasswordLength && password == defualtPassword
    }
}

