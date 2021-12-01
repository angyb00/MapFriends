//
//  DashBoardView.swift
//  project1
//
//  Created by Ali Ahsan on 10/6/21.
//

import SwiftUI
import UIKit
import MapKit

struct DashBoardView: View {
    
    var latitude: CLLocationDegrees
    var longitude: CLLocationDegrees
    
    init(latitude: CLLocationDegrees, longitude: CLLocationDegrees) {
        self.latitude = latitude
        self.longitude = longitude
    }
    
    @State var selectedView = 1
    
    var body: some View {
            
        TabView(selection: $selectedView) {
            
            MapView(coordinate: CLLocationCoordinate2D(latitude: latitude, longitude: longitude))
                .padding(.top, 30)
                    .font(.callout)
                    .tabItem {
                        Label("Map", systemImage: "1.circle")
                    }
                    .tag(1)

                    Button("Welcome to Travel Together") {
                        selectedView = 1
                    }
                    .padding()
                    .font(.callout)
                    .tabItem {
                        Label("Settings", systemImage: "2.circle")
                    }
                    .tag(2)
                }
            }
}

struct DashBoardView_Previews: PreviewProvider {
    static var previews: some View {
        DashBoardView(latitude: 0.0, longitude: 0.0)
    }
}

