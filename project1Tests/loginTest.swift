//
//  loginTest.swift
//  project1Tests
//
//  Created by Joji on 9/19/21.
//
import XCTest
@testable import project1

//Will eventually delete this boiler plate code and replace with
//test that will check for password length and to see if the user
//has already been registered in the system.

class loginTest: XCTestCase {
    var loginAuth: LoginAuth!

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        try super.setUpWithError()
        loginAuth = LoginAuth.sharedInstance
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        loginAuth = nil
        try super.tearDownWithError()
    }
    
    func testLoginUserNameVerificationSuccess() {
      // given username with correct length
      let userName = "testing"

      // then
        XCTAssertEqual(loginAuth.isValidUserName(userName), true, "Given username is wrong")
    }
    
    func testLoginUserNameVerificationFailure() {
      // given username with incorrect length
      let userName = "test"

      // then
        XCTAssertEqual(loginAuth.isValidUserName(userName), false, "Given username is wrong")
    }
    
    func testLoginPasswordVerificationSuccess() {
      // given password with correct length
      let password = "12345678"

      // then
        XCTAssertEqual(loginAuth.isValidPassword(password), true, "Given password is wrong")
    }
    
    func testLoginPasswordVerificationFailure() {
      // given password with incorrect length
      let password = "1234567"

      // then
        XCTAssertEqual(loginAuth.isValidUserName(password), false, "Given password is wrong")
    }
    
    func testLoginSuccess() {
      // given correct username and password
      let userName = "testing"
      let password = "12345678"
      
      // action
        loginAuth.attemptLogin(userName: userName, password: password)

      // then
        XCTAssertEqual(loginAuth.isLoggedin, true, "Given userName or password is icorrect")
    }
    
    func testLoginFailure() {
      // given incorrect username and password
      let userName = "testin"
      let password = "123458"
      
      // action
        loginAuth.attemptLogin(userName: userName, password: password)

      // then
        XCTAssertEqual(loginAuth.isLoggedin, false, "Given userName or password is icorrect")
    }

}
