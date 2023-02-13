//
//  AuthViewModel.swift
//  MapFriends
//
//  Created by Angarag Gansukh on 2/12/23.
//

import Foundation
import FirebaseAuth

class AuthViewModel: ObservableObject {
    let auth = Auth.auth()
    
    @Published var signedIn = false
    var isSignedIn: Bool { return auth.currentUser != nil }
    
    func logIn(email: String, password: String) {
        auth.signIn(withEmail: email, password: password) { [weak self] result, error in
            
            guard result != nil, error == nil else {
                print(error?.localizedDescription)
                return
            }
            
            // Success
            DispatchQueue.main.async {
                self?.signedIn = true
            }
        }
    }
    
    func signUp(email: String, password: String) {
        auth.createUser(withEmail: email, password: password) { [weak self] result, error in
            
            guard result != nil, error == nil else {
                print(error?.localizedDescription)
                return
            }
            
            // Success
            DispatchQueue.main.async {
                self?.signedIn = true
            }
        }
    }
    
    func signOut(){
        
        try? auth.signOut()
        self.signedIn = false
        
    }
}
