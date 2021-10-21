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
                DashBoardView(latitude: 0.0, longitude: 0.0)
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
