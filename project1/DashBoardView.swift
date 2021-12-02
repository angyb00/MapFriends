import MapKit
import SwiftUI
import UIKit

struct MapView: UIViewRepresentable {
    var coordinate: CLLocationCoordinate2D

    func makeUIView(context: Context) -> MKMapView {
        MKMapView(frame: .zero)
    }

    func updateUIView(_ view: MKMapView, context: Context) {
        let span = MKCoordinateSpan(latitudeDelta: 0.02, longitudeDelta: 0.02)
        let region = MKCoordinateRegion(center: coordinate, span: span)
        view.setRegion(region, animated: true)
    }
}

struct DashBoardView: View {
    @State var latitude: CLLocationDegrees = 34.052235
    @State var longitude: CLLocationDegrees = -118.243683

    var body: some View {
        // Tabs to transition to different views
        TabView {
            MapView(coordinate: CLLocationCoordinate2D(latitude: latitude, longitude: longitude))
                .padding(.top, 30)
                .font(.callout)
                .tabItem {
                    Label("Map", systemImage: "1.circle")
                }
                .tag(1)
            //friends list view
            friendsList()
                // .padding()
                .font(.callout)
                .tabItem {
                    Label("Friends", systemImage: "2.circle")
                }
                .tag(2)
            //Settings view
            settingsView()
                .font(.callout)
                .tabItem {
                    Label("Settings", systemImage: "3.circle")
                }.tag(3)
        }
    }
}

struct DashBoardView_Previews: PreviewProvider {
    static var previews: some View {
        DashBoardView()
    }
}
