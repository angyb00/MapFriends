import FirebaseCore
import SwiftUI

class AppDelegate: NSObject, UIApplicationDelegate {
    func application(
        _ application: UIApplication,
        didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]? = nil
    ) -> Bool {
        FirebaseApp.configure()
        return true
    }
}

@main
struct MapFriendsApp: App {
//    init(){
//        FirebaseApp.configure()
//    }
    @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate

    // let loginVM = AuthViewModel()
    var body: some Scene {
        WindowGroup {
            let loginVM = AuthViewModel()
            ContentView().environmentObject(loginVM)
        }
    }
}
