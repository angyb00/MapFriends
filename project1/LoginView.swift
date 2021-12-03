import SwiftUI


struct LoginView: View {
    
    @State var username: String = ""
    @State var password: String = ""
    
    @Binding var signedIn:Bool  //Dictates whether logged in or not
    
    fileprivate func WelcomeMessage() -> Text {
        return Text("Travel Together!")
            
    }
    
    var body: some View {
        VStack {
            VStack{
                WelcomeMessage()
                    .bold()
                    .font(.largeTitle)
                Image("plane")
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
                    

                Button(action: {self.signedIn = true},label: {Text("Login")})
                

            }
        }
        .padding()
    }
    
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginAuth()
    }
}
