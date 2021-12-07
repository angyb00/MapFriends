import Foundation
@testable import project1
import XCTest

class DataManagerTest: XCTestCase {
    private var sampleGroup: Create.Group!
    private var createObj: Create!
    private var sampleGrps: [Create.Group] = [.init(groupName: "First", location: "Paris", poi: "ET", groupNumber: 1),
                                              .init(groupName: "Second", location: "Delhi", poi: "KutubMinar", groupNumber: 2),
                                              .init(groupName: "Third", location: "Berlin", poi: "Berlin Tower", groupNumber: 3)]
    private var dm: DataManager!
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        self.createObj = Create.shared
        self.createObj.existingGroups = self.sampleGrps
        self.dm = DataManager.shared
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        self.createObj = nil
        self.sampleGrps = []
        self.sampleGroup = nil
        self.dm = nil
    }

    func test_writesToDefaultFileSuccessfully() {
        XCTAssertNoThrow(try self.dm.storeData())
    }

    func test_readAfterWriteAndCheckForCorrectness() {
        XCTAssertNoThrow(self.dm.loadAllGroups())
    }
}
