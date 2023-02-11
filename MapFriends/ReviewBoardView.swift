import SwiftUI

private struct Review: Identifiable {
    let content: String
    let id = UUID()
}

struct ReviewBoardView: View {
    var location: String
    var sublocation: String
    @State private var reviews: [Review]
    @State private var addReview = false // will determine to pull up text editor for writing

    init(for sublocation: String, at location: String) {
        self.location = location
        self.sublocation = sublocation
        
        print("\(location) \(sublocation)")

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

                // Bring up text editor for writing reviews
                Button("Add Review") {
                    addReview = !addReview
                }
                
                // Refresh the content
                Button("Refresh") {
                    do {
                        try reviews = BackendService.getReviews(for: sublocation, at: location).map { Review(content: $0) }
                    } catch {
                        reviews = []
                    }
                }
            }.padding()

            // Show previous reviews
            List(reviews) {
                Text($0.content)
                    .padding()
            }

            // sheet used for showing review text editor view
        }.sheet(isPresented: $addReview) {
            ReviewWritingView(for: sublocation, at: location)
        }
    }
}

struct ReviewBoardView_Previews: PreviewProvider {
    static var previews: some View {
        ReviewBoardView(for: "Disneyland", at: "Los Angeles")
    }
}
