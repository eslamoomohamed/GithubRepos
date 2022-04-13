//
//  StringsExtension.swift
//  GithubReposTests
//
//  Created by eslam mohamed on 12/04/2022.
//

import XCTest
@testable import GithubRepos

class StringsExtension: XCTestCase {

    var sut:IStrings!
    var dateFormatter:DateFormatter!
    var dateStr:IStrings!
    var dateFromString:IDate!
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        sut           = "2018-03-19T02:57:21Z"
        dateFormatter = DateFormatter()
        dateStr       = "2018-03-19T02:57:21Z"
        dateFromString = dateStr.convertToDate()
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        sut            = nil
        dateFormatter  = nil
        dateStr        = nil
        dateFromString = nil
    }

    func testConvertToDateFunc() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        dateFormatter.dateFormat  = "yyyy-MM-dd'T'HH:mm:ssZ"
        XCTAssertTrue(sut.convertToDate() == dateFormatter.date(from: dateStr as! String))
    }

    func testConvertToDateToDisplayFunc() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        XCTAssertTrue(dateFromString.convertDateToString() == "2018-03-19")
    }



}
