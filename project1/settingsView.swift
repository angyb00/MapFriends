
import SwiftUI

struct LoginPage: View {
    @State var loggedOut: Bool = false

    var body: some View {
        if loggedOut {
            LoginAuth()
        }
        else {
            settingsView(loggedOut: $loggedOut)
        }
    }
}

struct settingsView: View {
    @State var username = "John Doe"
    @State var notiEnabled = false
    @Binding var loggedOut: Bool

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
                    Button(action: { loggedOut = true }, label: { Text("Log out") })
                }
            }.navigationTitle("Settings")
        }
    }
}

struct settingsView_Previews: PreviewProvider {
    static var previews: some View {
        LoginPage()
    }
}
