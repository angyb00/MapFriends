import SwiftUI

// This will be used to list our friends
struct friends: Identifiable {
    let id = UUID()
    let name: String
    let emoji: String
}

// Will be our emoji profile picture
// Pass in a friends object and display the emoji
struct emojiView: View {
    let profileEmoji: friends
    var body: some View {
        Text(profileEmoji.emoji)
            .font(.largeTitle)
            .shadow(radius: 3)
            .overlay(Circle().stroke(Color.blue, lineWidth: 2))
    }
}

// Our new view that will be displayed once a friend is clicked on
// Pass in friends object display emoji and name on top
struct friendDetails: View {
    let person: friends

    var body: some View {
        VStack {
            HStack {
                Spacer()
                emojiView(profileEmoji: person)
                Text(person.name)
                Spacer()
            }.font(.largeTitle)
            Spacer()
        }
    }
}

/* Our list of friends
 *Can be edited to remove friends with the use of edit button
 *List all the friends and their emojis using navigationView and a list view builders
 *ForEach is utilized so we can utilize .onDelete method
 *NavigationLink is used to switch to our new view, friendDetails  
*/
struct friendsList: View {
    @State private var listOfPeople: [friends] = [friends(name: "John Deer", emoji: "🕷"), friends(name: "Amanda Vibes", emoji: "🎃"), friends(name: "Michael Meyers", emoji: "👻"), friends(name: "Freddy Kruger", emoji: "☠️"), friends(name: "Chucky the Doll", emoji: "👽")]

    var body: some View {
        NavigationView {
            List {
                ForEach(listOfPeople) {
                    people in
                    NavigationLink(destination: friendDetails(person: people)) {
                        HStack {
                            emojiView(profileEmoji: people)
                            Text(people.name)
                                .font(.headline)
                        }.padding()
                    }
                }.onDelete(perform: delete)
            }
            .navigationTitle("Friends")

            .toolbar {
                EditButton()
            }
        }
    }

    // will be called in .onDelete method to remove friends
    private func delete(offsets: IndexSet) {
        self.listOfPeople.remove(atOffsets: offsets)
    }
}

struct friendsList_Previews: PreviewProvider {
    static var previews: some View {
        friendsList()
    }
}
