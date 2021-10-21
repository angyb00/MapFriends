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
        self.latitude = 0.0
        self.longitude = 0.0
    }
    
    @State var selectedView = 1
    
    var body: some View {
            
        TabView(selection: $selectedView) {
            
            MapView(coordinate: CLLocationCoordinate2D(latitude: 37.334_900, longitude: -122.009_020))
                    .padding()
                    .font(.callout)
                    .tabItem {
                        Label("First Tab", systemImage: "1.circle")
                    }
                    .tag(1)

                    Button("Welcome to Travel Together") {
                        selectedView = 1
                    }
                    .padding()
                    .font(.callout)
                    .tabItem {
                        Label("Second Tab", systemImage: "2.circle")
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

