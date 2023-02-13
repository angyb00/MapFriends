import SwiftUI


struct settings: View {
    @State var username = "John Doe"
    @State var notiEnabled = false
    @EnvironmentObject var loginViewModel: AuthViewModel
    
    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Profile")) {
                    TextField("Username", text: $username)
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
        }
    }
}

struct settingsView_Previews: PreviewProvider {
    static var previews: some View {
        settings()
    }
}
