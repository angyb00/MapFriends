@testable import project1
import XCTest

class CreateGroupTest: XCTestCase {
    private var sampleGroupName = "Group1"
    private var sampleLocation = "Paris"
    private var samplePointOfInterest = "Eiffel Tower"
    private var sampleGroup: Create.Group!
    private var createObj: Create!

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        createObj = Create.shared
        sampleGroup = Create.Group(groupName: sampleGroupName, location: sampleLocation, poi: samplePointOfInterest, groupNumber: createObj.getNextGroupNumber())
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        createObj = nil
        sampleGroup = nil
    }

    func test_validSampleGroupName() {
        // given sameple group creation

        // then
        XCTAssertEqual(sampleGroup.groupName, sampleGroupName, "Expected \(sampleGroupName), Found \(sampleGroup.groupName)")
    }

    func test_invalidSampleGroupName() {
        // given invalid sampleGroup name
        let invalidGroupName = "Group12"

        // then
        XCTAssertNotEqual(sampleGroup.groupName.lowercased(),
                          invalidGroupName.lowercased(),
                          "sampleGroup name was found to errorneously matching invalidGroup name")
    }

    func test_validSampleLocation() {
        // given sameple group creation

        // then
        XCTAssertEqual(sampleGroup.location, sampleLocation, "Expected \(sampleLocation), Found \(sampleGroup.location)")
    }

    func test_inValidSampleLocation() {
        // given invalid sampleGroup name
        let invalidLocationName = "Tokyo"

        // then
        XCTAssertNotEqual(sampleGroup.location.lowercased(),
                          invalidLocationName.lowercased(),
                          "Invalid location name was found to be matched against valid location of sample Group")
    }

    func test_validSamplePointOfInterest() {
        // given sameple group creation

        // then
        XCTAssertEqual(sampleGroup.poi, samplePointOfInterest, "Expected \(samplePointOfInterest), Found \(sampleGroup.poi)")
    }

    func test_checkGroupExistenceAfterAddingGroup() {
        XCTAssertFalse(createObj.existingGroups.contains(where: { $0.groupName == sampleGroup.groupName }))
        createObj.addGroup(group: sampleGroup)
        XCTAssertTrue(createObj.existingGroups.contains(where: { $0.groupName == sampleGroup.groupName }))
        XCTAssertTrue(createObj.existingGroups.count == 1)
    }
}
