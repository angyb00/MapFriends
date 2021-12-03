import SwiftUI

struct LoginAuth: View{
    @State var signedIn = false
    
    var body: some View {
        if signedIn {
            DashBoardView()
        }
        else{
            LoginView(signedIn: $signedIn)
        }
    }
    
    
}

struct LoginAuth_Previews: PreviewProvider {
    static var previews: some View {
        LoginAuth()
    }
}
