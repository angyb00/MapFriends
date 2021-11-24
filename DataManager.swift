//
//  DataManager.swift
//  project1
//
//  Created by Joji on 11/20/21.
//

import Foundation

class DataManager {
    var plistURL: URL {
        let documents = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
        return documents.appendingPathComponent("GroupDetails.plist")
    }
    private init(){}
    static let shared = DataManager()

    func storeData(at location:URL!=nil) throws {
        let url = location ?? plistURL
        if let data = try? PropertyListEncoder().encode(Create.shared.existingGroups) {
            if FileManager.default.fileExists(atPath: url.path) {
                // Update an existing plist
                try? data.write(to: plistURL)
            } else {
                // Create a new plist
                FileManager.default.createFile(atPath: url.path, contents: data, attributes: nil)
            }
        }
    }

    func loadAllGroups(from plist:URL! = nil){
        let url = plist ?? plistURL
        if FileManager.default.fileExists(atPath: url.path) {
            guard let data = FileManager.default.contents(atPath: url.path) else {return}
            guard let storedGroups = try? PropertyListDecoder().decode([Create.Group].self, from: data) else {return}
            print("Stored Groups are \(storedGroups)")
            Create.shared.existingGroups = storedGroups
        }
    }
}
