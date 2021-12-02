import SwiftUI

struct settingsView: View {
    @State var username = ""
    @State var notiEnabled = false
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
            }.navigationTitle("Settings")
        }
    }
}

struct settingsView_Previews: PreviewProvider {
    static var previews: some View {
        settingsView()
    }
}

