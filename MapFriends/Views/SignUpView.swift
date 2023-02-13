import SwiftUI

struct SignUpView: View {
    @State var email: String = ""
    @State var password: String = ""
    @State var firstName: String = ""
    @State var lastName: String = ""
    @State var username: String = ""

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
                
            TextField("First Name", text: $firstName)
                .padding()
                .background(Color(.secondarySystemBackground))
                .autocorrectionDisabled(true)
                .autocapitalization(.none)
                .cornerRadius(20)
            
            TextField("Last Name", text: $lastName)
                .padding()
                .background(Color(.secondarySystemBackground))
                .autocorrectionDisabled(true)
                .autocapitalization(.none)
                .cornerRadius(20)
            
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
                guard !email.isEmpty, !password.isEmpty, !firstName.isEmpty, !lastName.isEmpty, !username.isEmpty else {
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
struct SignUpView_Previews: PreviewProvider {
    static var previews: some View {
        SignUpView()
    }
}
