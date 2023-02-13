import SwiftUI


struct ContentView: View {
    @EnvironmentObject var loginVM: AuthViewModel
    var body: some View {
        NavigationView {
            if loginVM.signedIn {
                DashBoardView()
            }
            else {
                LoginView()
            }
        }.onAppear {
            loginVM.signedIn = loginVM.isSignedIn
        }
    }
}

struct LoginView: View {
    @State var username: String = ""
    @State var password: String = ""
    @EnvironmentObject var loginViewModel: AuthViewModel
    
    fileprivate func WelcomeMessage() -> Text {
        return Text("Travel Together!")
    }
    
    var body: some View {
        VStack {
            WelcomeMessage()
                .bold()
                .font(.largeTitle)

            Image("travel")
                .resizable()
                .font(.largeTitle)
                .scaledToFit()
                
            TextField("Username", text: $username)
                .padding()
                .background(Color(.secondarySystemBackground))
                .autocorrectionDisabled(true)
                .autocapitalization(.none)
                .cornerRadius(20)
                
            SecureField("Password", text: $password)
                .padding()
                .autocorrectionDisabled(true)
                .background(Color(.secondarySystemBackground))
                .cornerRadius(20)
            
            Button(action: {
                guard !username.isEmpty, !password.isEmpty else {
                    return
                }
                
                loginViewModel.logIn(email: username, password: password)
                
            }, label: {
                Text("Login")
                    .foregroundColor(.white)
                    .frame(width: 200, height: 50)
                    .background(Color.black)
                    .cornerRadius(20)
                
            }).padding()
            
            NavigationLink("Create Account", destination: SignUpView())
                .padding()
            
            Spacer()
        }.padding()
    }
}

struct SignUpView: View {
    @State var email: String = ""
    @State var password: String = ""
    @EnvironmentObject var loginViewModel: AuthViewModel
    
    fileprivate func WelcomeMessage() -> Text {
        return Text("Travel Together!")
    }
    
    var body: some View {
        VStack {
            WelcomeMessage()
                .bold()
                .font(.largeTitle)

            Image("travel")
                .resizable()
                .font(.largeTitle)
                .scaledToFit()
                
            TextField("Email", text: $email)
                .padding()
                .background(Color(.secondarySystemBackground))
                .autocorrectionDisabled(true)
                .autocapitalization(.none)
                .cornerRadius(20)
                
            SecureField("Password", text: $password)
                .padding()
                .autocorrectionDisabled(true)
                .background(Color(.secondarySystemBackground))
                .cornerRadius(20)
            
            Button(action: {
                guard !email.isEmpty, !password.isEmpty else {
                    return
                }
                
                loginViewModel.signUp(email: email, password: password)
                
            }, label: {
                Text("Sign Up")
                    .foregroundColor(.white)
                    .frame(width: 200, height: 50)
                    .background(Color.black)
                    .cornerRadius(20)
                
            }).padding()
            
            Spacer()
        }.padding()
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
