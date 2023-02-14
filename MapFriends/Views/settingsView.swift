import SwiftUI


struct settings: View {
    @State var username = "John Doe"
    @State var notiEnabled = false
    @EnvironmentObject var loginViewModel: AuthViewModel
    let firstName = UserDefaults.standard.object(forKey: "firstName") as? String ?? "Error"
    let lastName = UserDefaults.standard.object(forKey: "lastName") as? String ?? "Error"

    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Profile")) {
                    
                   // TextField("Username", text: $username)
                    Text(firstName + " " + lastName)
                }
                Section(header: Text("Notifications")) {
                    Toggle(isOn: $notiEnabled) {
                        Text("Enabled")
                    }
                }
                Section(header: Text("About")) {
                    HStack {
                        Text("Version")
                        Spacer()
                        Text("1.0")
                    }
                }
                Section {
                    // Button for logging out
                    Button(action: { loginViewModel.signOut()},
                           label: { Text("Sign out")
                            .bold()
                            .frame(maxWidth: .infinity, alignment: .center)
                            .foregroundColor(.red)
                    })
                }
            }.navigationTitle("Settings")
        }.onAppear{
            let firstName = UserDefaults.standard.object(forKey: "firstName") as? String ?? ""
            let lastName = UserDefaults.standard.object(forKey: "lastName") as? String ?? ""
            username = firstName + " " + lastName
        }
    }
}

struct settingsView_Previews: PreviewProvider {
    static var previews: some View {
        settings()
    }
}
