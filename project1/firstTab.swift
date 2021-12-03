import MapKit
import SwiftUI

struct MapView: UIViewRepresentable { // Used to create map
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

// Will go on as the Map View on Dash Board View
struct firstTab: View {
    @State var latitude: CLLocationDegrees = 34.052235
    @State var longitude: CLLocationDegrees = -118.243683
    @State var showCreateGroup = false
    @State var showGroups = false

    var body: some View {
        ZStack {
            MapView(coordinate: CLLocationCoordinate2D(latitude: latitude, longitude: longitude))
                .padding(.top, 30)
                .font(.callout)
                .edgesIgnoringSafeArea(.top)
            VStack {
                HStack {
                    Button { // Add groups button
                        self.showCreateGroup = true
                    } label: {
                        Image(systemName: "plus.circle.fill")
                            .font(.largeTitle)
                    }
                    .fullScreenCover(isPresented: $showCreateGroup) {
                        print("")
                    } content: {
                        GroupDetails()
                    }

                    Spacer()

                    Button { // Show created groups button
                        self.showGroups = true
                    } label: {
                        Text("Groups")
                            .bold()
                            .font(.headline)
                    }.fullScreenCover(isPresented: $showGroups) {
                        print("")
                    } content: {
                        ExistingGroups()
                    }
                }

                Spacer()
            }
        }
    }
}

struct firstTab_Previews: PreviewProvider {
    static var previews: some View {
        firstTab()
    }
}
