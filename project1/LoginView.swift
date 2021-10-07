//
//  loginScreen.swift
//  project1
//
//  Created by Joji on 9/21/21.
//

import SwiftUI
import UIKit

//not entirely sure how UI works yet in swfit with view controllers and UI kits but
//I think a few buttons and field on the splash screen page will need to be displayed
//like the login and signup buttons along with text field boxes for each

//struct Button where Label: View{
//
//}


struct LoginView: View {
    
    @State var username: String = ""
    @State var password: String = ""
    
    fileprivate func WelcomeMessage() -> Text {
        return Text("Travel Together!")
            
    }
    
    var body: some View {
        VStack {
            VStack{
                WelcomeMessage()
                Image("travel")
                    .resizable()
                    .font(.largeTitle)
                    
                TextField("Username", text: $username)
                    .padding()
                    .cornerRadius(5.0)
                    .padding(.bottom,20)
                
                SecureField("Password",text :$password)
                    .padding()
                    .cornerRadius(5.0)
                    .padding(.bottom,20)
                    
            }
            .padding()
            Button(action: login) {
                Text("LOGIN")
                    .font(.headline)
                    .foregroundColor(.black)
                    .cornerRadius(35.0)
                    .frame(width: 200, height: 50)
            }
        }
        .padding()
    }
    
    private func login() {
        let isValid = LoginAuth.sharedInstance.verifyUser(userName: username, password: password)
        if (isValid) {
            
        }
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}


