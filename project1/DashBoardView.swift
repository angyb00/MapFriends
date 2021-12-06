

import MapKit
import SwiftUI

struct DashBoardView: View {
    var body: some View {
        ZStack(alignment: .topLeading) {
            TabView {
                // Map view with groups
                firstTab()
                    .tabItem {
                        Label("Map", systemImage: "map.fill")
                    }
                    .tag(1)

                // Friends list tab
                friendsList()
                    .tabItem {
                        Label("Friends", systemImage: "person.crop.circle.fill")
                    }
                    .tag(2)

                // Settings view
                settings()
                    .tabItem {
                        Label("Settings", systemImage: "gear")
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
