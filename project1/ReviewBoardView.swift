//
//  ReviewBoardView.swift
//  project1
//
//  Created by Zakee Khattak on 10/7/21.
//

import SwiftUI

private struct Review: Identifiable {
    let content: String
    let id = UUID()
}

struct ReviewBoardView: View {
    @State private var reviews = BackendService.getReviews(for: "Disneyland", at: "Los Angeles").map {Review(content: $0)}
    
    var body: some View {
        VStack(alignment: .leading) {
            VStack(alignment: .leading) {
                Text("Reviews for Disneyland at Los Angeles")
                    .font(.title)
                    .bold()
                Button("Add Review") {
                    let newReview = "Zakee K. - The mouse sucks"
                    
                    BackendService.postReview(for: "Disneyland", at: "Los Angeles", text: newReview)
                    refreshReviews()
                }
            }.padding()
            
            List(reviews) {
                Text($0.content)
                    .padding()
            }
        }
    }
    
    func refreshReviews() {
        reviews = BackendService.getReviews(for: "Disneyland", at: "Los Angeles").map {Review(content: $0)}
    }
}

struct ReviewBoardView_Previews: PreviewProvider {
    static var previews: some View {
        ReviewBoardView()
    }
}
