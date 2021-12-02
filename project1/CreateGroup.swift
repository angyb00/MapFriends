//
//  CreateGroup.swift
//  project1
//
//  Created by Joji on 10/16/21.
//

import Foundation

class Create {
    struct Group:Codable,Hashable {
        var groupName:String
        var location:String
        var poi:String
        var groupNumber:Int

        enum CodingKeys:String,CodingKey {
            case groupName
            case location
            case poi
            case groupNumber
        }

        init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            self.groupName = try container.decode(String.self, forKey: .groupName)
            self.location = try container.decode(String.self, forKey: .location)
            self.poi = try container.decode(String.self, forKey: .poi)
            self.groupNumber = try container.decode(Int.self, forKey: .groupNumber)
        }

        func encode(to encoder: Encoder) throws {
            var container = encoder.container(keyedBy: CodingKeys.self)
            try container.encode(groupName, forKey: .groupName)
            try container.encode(location, forKey: .location)
            try container.encode(poi, forKey: .poi)
            try container.encode(groupNumber, forKey: .groupNumber)

        }

        init(groupName:String, location:String, poi:String, groupNumber:Int) {
            self.groupName = groupName
            self.location  = location
            self.poi = poi
            self.groupNumber = groupNumber
        }
    }

    func getNextGroupNumber()-> Int{
        existingGroups.count
    }

    var allGroups:Set<String>
    var existingGroups:[Group]

    static var shared = Create()

    private init(){
        allGroups = Set<String>()
        existingGroups = [Group]()
    }

    func checkExistance(name groupName:String) -> Bool {
        self.allGroups.contains(groupName)
    }
    func delete(at index:IndexSet){
        existingGroups.remove(atOffsets: index)
        DispatchQueue.main.async {
            self.updateDB()
        }
    }
    
    func addGroup(group:Group){
        allGroups.insert(group.groupName)
        self.existingGroups.append(group)
        updateDB()
    }

    func updateDB(){
        do{
            try DataManager.shared.storeData()
        } catch (let err as NSError){
            print(err.localizedDescription)
        }
    }
}
