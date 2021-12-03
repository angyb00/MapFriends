import MapKit
import SwiftUI

struct DashBoardView: View {
    var body: some View {
        ZStack(alignment: .topLeading) {
            TabView {
                // Map view with groups
                firstTab()
                    .tabItem {
                        Label("Map", systemImage: "1.circle")
                    }
                    .tag(1)

                // Friends list tab
                friendsList()
                    .tabItem {
                        Label("Friends", systemImage: "2.circle")
                    }
                    .tag(2)

                // Settings view
                settings()
                    .tabItem {
                        Label("Settings", systemImage: "3.circle")
                    }.tag(3)

            }.onAppear {
                loadGroups()
            }
        }
    }
}

func loadGroups() {
    DataManager.shared.loadAllGroups()
}

struct DashBoardView_Previews: PreviewProvider {
    static var previews: some View {
        DashBoardView()
    }
}
