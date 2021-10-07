//
//  ReviewBoardView.swift
//  project1
//
//  Created by Zakee Khattak on 10/7/21.
//

import SwiftUI

struct ReviewBoardView: View {
    var body: some View {
        VStack(alignment: .leading) {
            Text("Reviews for Disneyland at Los Angeles")
                .bold()
            Button("Add Review") {
                
            }
            Text(BackendService.getReviews(for: "Disneyland", at: "Los Angeles")[0])
            Text(BackendService.getReviews(for: "Disneyland", at: "Los Angeles")[1])
        }
    }
}

struct ReviewBoardView_Previews: PreviewProvider {
    static var previews: some View {
        ReviewBoardView()
    }
}
