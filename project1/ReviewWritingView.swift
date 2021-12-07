import SwiftUI

struct ReviewWritingView: View {
    @State var location: String
    @State var sublocation: String
    @State var reviewText: String = "Write your review here..."

    init(for subloc: String, at loc: String) {
        self.location = loc
        self.sublocation = subloc
    }

    var body: some View {
        VStack(alignment: .leading) {
            // Header
            VStack(alignment: .leading) {
                Text("Reviewing \(sublocation) at \(location)")
                    .font(.title)
                    .bold()
            }.padding()

            // Text field
            TextEditor(text: $reviewText)
                .font(.system(size: 18))
                .border(.blue, width: 3)

            // Button to post review
            Button(action: {
                       postBtnAction()
                   },
                   label: { Text("Post") })
                .font(.system(size: 24))
                .padding()
        }
    }

    // Add it to the list of reviews
    func postBtnAction() {
        guard let usr = BackendService.currentUsername else {
            return
        }

        let contents = usr + " - " + reviewText

        do {
            try BackendService.postReview(for: sublocation, at: location, text: contents)
        } catch BackendError.locationNotFound {
            // Pop error message
            print("Location not found.")
            return
        } catch BackendError.sublocationNotFound {
            // Pop error message
            print("Sublocation not found.")
            return
        } catch {
            // Pop error message
            print("Unexpected error.")
            return
        }
    }
}

struct ReviewWritingView_Previews: PreviewProvider {
    static var previews: some View {
        ReviewWritingView(for: "Disneyland", at: "Los Angeles")
    }
}
