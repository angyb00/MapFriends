import SwiftUI

// View will decide whether logged in or log out is pressed
struct settings: View {
    @State var loggedOut: Bool = false

    var body: some View {
        // If log out is pressed, go back to login view
        if loggedOut {
            LoginAuth()
        }
        // Stay on settings view if logged in
        else {
            settingsView(loggedOut: $loggedOut)
        }
    }
}

struct settingsView: View {
    @State var username = "John Doe"
    @State var notiEnabled = false
    @Binding var loggedOut: Bool // Dictates what view settings will show

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
                    Button(action: { loggedOut = true }, label: { Text("Log out")
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
