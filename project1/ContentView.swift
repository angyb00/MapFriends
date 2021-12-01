//
//  ContentView.swift
//  project1
//
//  Created by Zakee Khattak on 9/16/21.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject var login: LoginAuth

        var body: some View {
            if self.login.isLoggedin || isAlreadyLogin(){
                DashBoardView(latitude: 34.052235, longitude:  -118.243683)
            } else {
                LoginView()
            }

        }
    
    func isAlreadyLogin() -> Bool {
        let loggedIn = UserDefaults.standard.bool(forKey: "loggedIn")
        print(loggedIn)
        return loggedIn
    }
}
