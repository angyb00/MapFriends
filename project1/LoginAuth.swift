import SwiftUI

// Decides view based on if logged in or not
struct LoginAuth: View {
    // Initial view will be log in view
    // Once signedIn is true, view will change to dash board
    @State var signedIn = false
    
    var body: some View {
        // if login pressed, change to dash board view
        if signedIn {
            DashBoardView()
        }
        // if login not pressed, stay on log in view
        else {
            LoginView(signedIn: $signedIn)
        }
    }
}

struct LoginAuth_Previews: PreviewProvider {
    static var previews: some View {
        LoginAuth()
    }
}
