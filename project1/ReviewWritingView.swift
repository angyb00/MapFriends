//
//  ReviewWritingView.swift
//  project1
//
//  Created by Zakee Khattak on 11/18/21.
//

import SwiftUI

struct ReviewWritingView: View {
    @State private var location: String
    @State private var sublocation: String
    @State private var reviewText: String = "Write your review here..."
    
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
                
            
            // Footer
            Button("Post", action: postBtnAction)
            .font(.system(size: 24))
            .padding()
        }
    }
    
    func postBtnAction() {
        guard let usr = BackendService.currentUsername else {
            return
        }
        
        let contents = usr + " - " + reviewText
        
        do {
            try BackendService.postReview(for: sublocation, at: location, text: contents)
        } catch BackendError.locationNotFound {
            // Pop error message
            return
        } catch BackendError.sublocationNotFound {
            // Pop error message
            return
        } catch {
            // Pop error message
            return
        }
    }
}

struct ReviewWritingView_Previews: PreviewProvider {
    static var previews: some View {
        ReviewWritingView(for: "Disneyland", at: "Los Angeles")
    }
}
