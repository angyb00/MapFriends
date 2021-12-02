//
//  loginAuth.swift
//  project1
//
//  Created by Joji on 9/21/21.
//

import Foundation

//not sure about this yet but we will need some sort of file with
//master passwords that will either have hardcoded values for select
//users, or we will need some other form of storing these values
//once the password criteria is met 

class loginAuth{
   var  username: String
    var  password: Int
    
    init(username:String, password:Int){
        self.username = username
        self.password = password
    }
    
    func userVerified() ->Bool {
        //check to see if the username and password provided meet
        //criteria with some hardcoded values we will prove in the future
        //until we figure out a solution for storing these
        return true
    }
    
    func passwordLength() ->Bool{
        //check to see if the password meets length and custom character requirements
        return true
    }
}

