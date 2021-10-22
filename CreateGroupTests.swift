//
//  CreateGroupTests.swift
//  project1UITests
//
//  Created by Joji on 10/19/21.
//


import XCTest
@testable import project1

class CreateGroupTest: XCTestCase {
    private var sampleGroupName = "Group1"
    private var sampleLocation = "Paris"
    private var samplePointOfInterest = "Eiffel Tower"
    private var sampleGroup:Create.Group!
    private var createObj:Create!

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        self.createObj = Create.shared
        self.sampleGroup = Create.Group(groupName: self.sampleGroupName, location: self.sampleLocation, poi: self.samplePointOfInterest,groupNumber: self.createObj.getNextGroupNumber())

    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        self.createObj = nil
        self.sampleGroup = nil
    }

    func test_onCreateSharedObjectExistingGroupsIsEmpty(){
        XCTAssertEqual(createObj.existingGroups.count,0,"shared object on creation should not have any existing groups")
    }

    func test_validSampleGroupName(){
        //given sameple group creation

        //then
        XCTAssertEqual(sampleGroup.groupName, sampleGroupName, "Expected \(sampleGroupName), Found \(sampleGroup.groupName)")
    }

    func test_invalidSampleGroupName(){
        //given invalid sampleGroup name
        let invalidGroupName = "Group12"

        //then
        XCTAssertNotEqual(sampleGroup.groupName.lowercased(),
                          invalidGroupName.lowercased(),
                          "sampleGroup name was found to errorneously matching invalidGroup name")
    }

    func test_validSampleLocation(){
        //given sameple group creation

        //then
        XCTAssertEqual(sampleGroup.location, sampleLocation, "Expected \(sampleLocation), Found \(sampleGroup.location)")
    }

    func test_inValidSampleLocation(){
        //given invalid sampleGroup name
        let invalidLocationName = "Tokyo"

        //then
        XCTAssertNotEqual(sampleGroup.location.lowercased(),
                          invalidLocationName.lowercased(),
                          "Invalid location name was found to be matched against valid location of sample Group")
    }

    func test_validSamplePointOfInterest(){
        //given sameple group creation

        //then
        XCTAssertEqual(sampleGroup.poi, samplePointOfInterest, "Expected \(samplePointOfInterest), Found \(sampleGroup.poi)")
    }

    func test_sampleGroupNameDoesNotExist(){
        //given sampleGroup does not exist in groups
        //checkExistence should return false
        XCTAssertEqual(createObj.checkExistance(name: sampleGroupName),false,"expected sample group not to be present, was found to be present")
    }


    func test_checkGroupExistenceAfterAddingGroup(){
        XCTAssertFalse(createObj.existingGroups.contains(where: {$0.groupName == sampleGroup.groupName}))
        createObj.addGroup(group: sampleGroup)
        XCTAssertTrue(createObj.existingGroups.contains(where: {$0.groupName == sampleGroup.groupName}))
        XCTAssertTrue(createObj.existingGroups.count == 1)
    }
}

