import Foundation
import SwiftUI

enum BackendError: Error {
    case locationNotFound
    case sublocationNotFound
}

enum BackendService {
    static var currentUsername: String?
    static var currentUserGroups: [String] = []
    private static var currentFriendsList: [String] = [
        "John Deer",
        "Amanda Vibes",
        "Michael Meyers",
        "Freddy Kruger",
        "Chucky the Doll"
    ]

    // Example data
    private static let locations = [
        "New York": [
            "Broadway",
            "Statue of Liberty"
        ],
        "Los Angeles": [
            "Disneyland", // not really LA but who cares
            "Rodeo Drive"
        ],
        "London": [
            "Buckingham Palace",
            "Big Ben"
        ],
        "Paris": [
            "Eiffel Tower"
        ],
        "Beijing": [
            "The Great Wall of China",
            "The Forbidden City"
        ],
        "Tokyo": [
            "Tokyo Skytree",
            "Shibuya 109"
        ]
    ]

    // Example data
    private static var groups = [
        "New York": [
            "Ey I'm Walkin Here",
            "Broadway-Goers",
            "Joycon Boyz Memorial Group"
        ],
        "Los Angeles": [
            "I❤️LA",
            "Let's Go Dodgers",
            "Hollywood Signposts",
            "Disney Moms Unite!!! :))))"
        ],
        "London": [
            "The Lads You Wish You Had",
            "Not Gonna Eat a Crumb Until Margaret Thatcher's Dead"
            // look i hear she sucks
        ],
        "Paris": [
            "We Know You Came for the Tower, Let's Go See It"
        ],
        "Beijing": [
            "Great Wall Gang"
        ],
        "Tokyo": [
            "Men of Culture", // you just KNOW some weeb would do this
            "Harajuku Fashion Association"
        ]
    ]

    // L O R E M   I P S U M
    private static var reviews = [
        "New York": [
            "Broadway": [
                "Sam P. B. - Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aliquam malesuada sem vitae justo elementum rhoncus. Nulla laoreet dui massa, non pretium orci lacinia at.",
                "Joseph J. - Mauris vel massa eu metus posuere faucibus. Pellentesque et metus at massa dapibus fringilla non sed odio. Aliquam pretium tortor nec lacinia fermentum."
            ],
            "Statue of Liberty": [
                "Solidus S. - Aliquam hendrerit fermentum mi, sit amet lacinia dui mattis quis. Morbi ut nulla quis felis venenatis ornare sit amet sed arcu. ",
                "Alex L. - In posuere pretium ipsum ac fringilla. Curabitur eu facilisis velit. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia curae; Vestibulum quis lacinia justo, sed pulvinar enim."
            ]
        ],
        "Los Angeles": [
            "Disneyland": [
                "Sora K. H. - Quisque aliquet ex dapibus lectus dictum, nec pharetra orci porta. Sed lorem dolor, mattis quis nunc nec, malesuada porta massa.",
                "Stan L. - Suspendisse risus magna, ultricies eget bibendum tincidunt, maximus id nisl. Nulla a dolor ac enim pulvinar pellentesque a id nisl. Integer luctus ut turpis vitae vehicula. "
            ],
            "Rodeo Drive": [
                "Jordan M. - Fusce lobortis urna at ligula porta volutpat. Pellentesque dictum erat dui, eget dignissim turpis tempus id. Donec at eros eget velit interdum mattis consequat ac erat.",
                "Cloud S. - Aliquam erat volutpat. Praesent justo velit, finibus quis elit sed, tincidunt sagittis ligula. Nullam sem diam, cursus vitae nulla ut, imperdiet egestas risus."
            ]
        ],
        "London": [
            "Buckingham Palace": [
                "John B. - Pellentesque neque neque, ullamcorper venenatis vulputate non, ultrices non augue. Donec enim risus, lobortis eu laoreet at, sagittis ac lacus.",
                "David C. - Nunc pulvinar massa at tellus porttitor commodo. Nulla laoreet risus mi, nec efficitur ipsum cursus vel. Vivamus lectus nisl, tristique ac auctor ut, porta et ante. Nulla lorem est, tempus ac tempus ut, fermentum at augue. Nulla sed risus purus. "
            ],
            "Big Ben": [
                "Christopher R. - Pellentesque eu lorem id nulla fermentum tincidunt. Curabitur sed tincidunt mi. Duis in dolor lacinia, elementum ipsum vitae, ornare diam.",
                "Peter P. - Quisque nec molestie ipsum. Nulla nec dui elementum, gravida dolor nec, interdum nulla. Vestibulum interdum aliquet ex, vulputate accumsan purus feugiat at."
            ]
        ],
        "Paris": [
            "Eiffel Tower": [
                "Marianne F. - Morbi interdum ultricies diam. Morbi laoreet cursus condimentum. Phasellus id augue condimentum mauris rutrum consectetur a ac turpis."
            ]
        ],
        "Beijing": [
            "The Great Wall of China": [
                "Fa M. - Aenean non est quis tellus gravida posuere tincidunt cursus metus. Sed dapibus, metus nec pretium sollicitudin, tortor dolor scelerisque felis, sed fringilla justo sem vel nulla."
            ],
            "The Forbidden City": [
                "Po P. - Curabitur quis velit ligula. Nullam mollis vestibulum ipsum, sit amet finibus magna sollicitudin vitae. Nunc non augue quis risus sollicitudin pulvinar."
            ]
        ],
        "Tokyo": [
            "Tokyo Skytree": [
                "Flynn S. - Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia curae; Cras condimentum elementum sem. Maecenas nec ultrices justo."
            ],
            "Shibuya 109": [
                "Neku S. - Quisque lectus nisi, laoreet sit amet aliquam a, tincidunt vitae orci."
            ]
        ]
    ]

    static func login(username: String, password: String) {
        currentUsername = username
    }

    static func logout() {
        currentUsername = nil
        currentUserGroups = []
    }

    static func getLocations() -> [String] {
        return Array(locations.keys)
    }

    static func getSublocations(at location: String) throws -> [String] {
        guard let loc = locations[location] else { throw BackendError.locationNotFound }
        return loc
    }

    static func getGroups(at location: String) throws -> [String] {
        guard let grps = groups[location] else { throw BackendError.locationNotFound }
        return grps
    }

    static func joinGroup(_ group: String) {
        currentUserGroups.append(group)
    }

    static func leaveGroup(_ group: String) {
        currentUserGroups.removeAll { $0 == group }
    }

    static func createGroup(name: String, at location: String) throws {
        guard let grps = groups[location] else { throw BackendError.locationNotFound }
        var groupsForLoc = grps
        groupsForLoc.append(name)
        groups[location] = groupsForLoc
    }

    static func getReviews(for sublocation: String, at location: String) throws -> [String] {
        guard let sublocs = reviews[location] else { throw BackendError.locationNotFound }
        guard let revs = sublocs[sublocation] else { throw BackendError.sublocationNotFound }
        return revs
    }

    static func postReview(for sublocation: String, at location: String, text: String) throws {
        guard let sublocs = reviews[location] else { throw BackendError.locationNotFound }
        guard let revs = sublocs[sublocation] else { throw BackendError.sublocationNotFound }
        reviews[location]![sublocation]!.append(text)
    }

    static func getFriends() -> [String] {
        return currentFriendsList
    }

    static func addFriend(_ name: String) {
        currentFriendsList.append(name)
    }

    static func removeFriend(_ name: String) {
        currentFriendsList.removeAll { $0 == name }
    }
}
