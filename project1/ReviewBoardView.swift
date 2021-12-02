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
    var location: String
    var sublocation: String
    @State private var reviews: [Review]
    @State private var postFailedAlert: Bool = false
    
    init(for sublocation: String, at location: String) {
        self.location = location
        self.sublocation = sublocation
        
        do {
            try reviews = BackendService.getReviews(for: sublocation, at: location).map { Review(content: $0) }
        } catch {
            reviews = []
        }
    }
    
    var body: some View {
        VStack(alignment: .leading) {
            VStack(alignment: .leading) {
                Text("Reviews for \(sublocation) at \(location)")
                    .font(.title)
                    .bold()
                Button("Add Review") {
                    let newReview = "Zakee K. - The mouse sucks"
                    do {
                    try BackendService.postReview(for: sublocation, at: location, text: newReview)
                    } catch {
                        // Don't actually post the thing
                    }
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
        guard let revs = try? BackendService.getReviews(for: sublocation, at: location) else {
            reviews = []
            return
        }
        
        reviews = revs.map { Review(content: $0) }
    }
}

struct ReviewBoardView_Previews: PreviewProvider {
    static var previews: some View {
        ReviewBoardView(for: "Disneyland", at: "Los Angeles")
    }
}
