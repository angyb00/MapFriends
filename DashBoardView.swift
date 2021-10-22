//
//  DashBoardView.swift
//  project1
//
//  Created by Joji on 10/21/21.
//

import Foundation
import SwiftUI
import UIKit

struct DashBoardView: View {
    
    @State var selectedView = 1
    
    var body: some View {
            
        TabView(selection: $selectedView) {
                    Button("Welcome to Travel Together") {
                        selectedView = 2
                    }
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
        DashBoardView()
    }
}

