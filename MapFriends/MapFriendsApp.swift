import SwiftUI
import FirebaseCore

@main
struct MapFriendsApp: App {
        
    init(){
        FirebaseApp.configure()
    }
    var body: some Scene {
        WindowGroup {
            let loginVM = AuthViewModel()
            ContentView().environmentObject(loginVM)
        }
    }
}
