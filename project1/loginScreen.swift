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


struct loginScreen: View {
    var body: some View {
        Text("Welcome to Travel Together")
            .font(.callout)
            .fontWeight(.bold)
    }
}

struct loginScreen_Previews: PreviewProvider {
    static var previews: some View {
        loginScreen()
    }
}


