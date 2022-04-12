//
//  DateExtension.swift
//  GithubReposTests
//
//  Created by eslam mohamed on 12/04/2022.
//

import XCTest
@testable import GithubRepos

class DateExtension: XCTestCase {
    
    var sut:String!
    var dateStr:String!

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        sut     = "2018-03-19T02:57:21Z".convertToDate()?.convertDateToString()
        dateStr = "2018-03-19"
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        sut     = nil
        dateStr = nil
    }

    func testConvertDateToStringFunc() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        XCTAssertTrue(sut == dateStr)
    }


}
