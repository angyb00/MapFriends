
import MapKit
import SwiftUI

struct PlaceAnnotationView: View {
    var body: some View {
        VStack {
            Image(systemName: "mappin.circle.fill")
                .font(.title)
                .foregroundColor(.red)

            Image(systemName: "arrowtriangle.down.fill")
                .font(.caption)
                .foregroundColor(.red)
                .offset(x: 0, y: -5)
        }
    }
}

struct Location: Identifiable {
    let id = UUID()
    var locationName: String
    var coordinates: CLLocationCoordinate2D
}

// Will go on as the Map View on Dash Board View
struct firstTab: View {
    @State var showCreateGroup = false
    @State var showGroups = false
    @State var reviewMode = false
    @State var region = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 33.81821, longitude: -117.9190), span: MKCoordinateSpan(latitudeDelta: 0.02, longitudeDelta: 0.02))
    private(set) var locations = [Location(locationName: "DisneyLand", coordinates: .init(latitude: 33.8121, longitude: -117.9190))]

    var body: some View {
        ZStack {
            // Map view with clickable annotions
            Map(coordinateRegion: $region, annotationItems: locations) { location in
                MapAnnotation(coordinate: location.coordinates) {
                    Button(action: {
                        reviewMode = !reviewMode
                    }, label: {
                        PlaceAnnotationView()
                    })
                }
            }
            .padding(.top)
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
                    }.fullScreenCover(isPresented: $showGroups) {} content: {
                        ExistingGroups()
                    }
                }

                Spacer()
            }
        }.sheet(isPresented: $reviewMode) {
            ReviewBoardView(for: "Disneyland", at: "Los Angeles")
        }
    }
}

struct firstTab_Previews: PreviewProvider {
    static var previews: some View {
        firstTab()
    }
}
