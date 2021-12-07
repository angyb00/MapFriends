import XCTest
import SwiftUI
@testable import project1

class project1Tests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
    func testFriendsList(){
        let friendsList = friendsList()
        
        
        XCTAssertEqual(friendsList.listOfPeople.count, 5)
        XCTAssertFalse(friendsList.addFriend)
        XCTAssertEqual(friendsList.friendName, "")
        
       
    }
    
    func testSettingsView(){
        
       
        let settings = settingsView(loggedOut: .constant(false))
        XCTAssertFalse(settings.loggedOut)
        XCTAssertEqual(settings.username, "John Doe")
        

        
    }
    func testMainView(){
        let MainView = firstTab()

        XCTAssertFalse(MainView.showGroups)
        XCTAssertFalse(MainView.reviewMode)
        XCTAssertFalse(MainView.showCreateGroup)

    }
    
    func testLoginAuth(){
        let auth = LoginAuth()
        XCTAssertFalse(auth.signedIn)
    }
    
    func testLoginView(){
        let Login = LoginView(signedIn: .constant(false))
        
        XCTAssertEqual(Login.username, "")
        XCTAssertEqual(Login.password, "")
        XCTAssertFalse(Login.signedIn)
    }
    
    func testGroupDetails(){
        let groupDetails = GroupDetails()
        
        XCTAssertEqual(groupDetails.groupName, "")
        XCTAssertEqual(groupDetails.pointOftInterest, "")
        XCTAssertEqual(groupDetails.location, "")
        XCTAssertFalse(groupDetails.addedGrp)
        XCTAssertFalse(groupDetails.enableAddButton)
    }

}
