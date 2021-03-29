//
//  ValidationServiceTest.swift
//  unitTestExampleTests
//
//  Created by Soda on 3/29/21.
//
@testable import unitTestExample
import XCTest


class ValidationServiceTest: XCTestCase {
    
    var validtion : ValidationService!
    
    override  func setUp() {
        super.setUp()
        validtion = ValidationService()
    }
    override  func tearDown() {
        super.tearDown()
        validtion = nil
    }
    func testIsVaildEmail() throws {
        XCTAssertNoThrow(try validtion.validateEmail("Soda"))
    }
    func testIsEmailIsNill() throws {
        let expatesError = ValidationError.invalidValue
        var error :ValidationError?
        XCTAssertThrowsError(try validtion.validateEmail(nil)) { throwError in
            error = throwError as? ValidationError
        }
        XCTAssertEqual(expatesError, error)
        XCTAssertEqual(expatesError.errorDescription, error?.errorDescription)
    }
    func testIsEmailShort() throws {
        let expatesError = ValidationError.usernameTooShort
        var error :ValidationError?
        
        XCTAssertThrowsError(try validtion.validateEmail("so")) { throwError in
            error = throwError as? ValidationError
        }
        XCTAssertEqual(expatesError, error)
        XCTAssertEqual(expatesError.errorDescription, error?.errorDescription)
        
    }
    func testIsEmailTooLong() throws {
        let expatesError = ValidationError.usernameTooLong
        var error :ValidationError?
        let username = "Very long email text"
        XCTAssertTrue(username.count == 20)
        
        XCTAssertThrowsError(try validtion.validateEmail(username)) { throwError in
            error = throwError as? ValidationError
        }
        XCTAssertEqual(expatesError, error)
        XCTAssertEqual(expatesError.errorDescription, error?.errorDescription)
    }
    func testPasswordIsVaild() throws {
        
        XCTAssertNoThrow(try validtion.validatepassWord("12345689"))
    }
    func testpasswordIsIsNill() throws {
        
        let expatesError = ValidationError.invalidValue
        var error : ValidationError?
        XCTAssertThrowsError(try validtion.validatepassWord(nil)) { throwError in
            error = throwError as? ValidationError
        }
        XCTAssertEqual(expatesError, error)
        XCTAssertEqual(expatesError.errorDescription, error?.errorDescription)
        
    }
    func testPasswordISToLong() throws {
        
        let expatesError = ValidationError.passwordTooLong
        var error :ValidationError?
        let password = "12345678912345678912356"
        
        XCTAssertThrowsError(try validtion.validatepassWord(password)) { throwError in
            error = throwError as? ValidationError
        }
        XCTAssertEqual(expatesError, error)
        XCTAssertEqual(expatesError.errorDescription, error?.errorDescription)
        
    }
    func testPasswordISTooShort() throws {
        
        let expatesError = ValidationError.passwordTooShort
        var error :ValidationError?
        
        XCTAssertThrowsError(try validtion.validatepassWord("12345")) { throwError in
            error = throwError as? ValidationError
        }
        XCTAssertEqual(expatesError, error)
        XCTAssertEqual(expatesError.errorDescription, error?.errorDescription)
        
    }
    
    
    
}
