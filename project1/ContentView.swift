//
//  ContentView.swift
//  project1
//
//  Created by Zakee Khattak on 9/16/21.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
    
        
        NavigationView{
            List {
                Text("Friend 1")
                Text("Friend 2")
                Text("Friend 3")
                Text("Friend 4")
            }.toolbar(content: {
                EditButton()
            })
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
