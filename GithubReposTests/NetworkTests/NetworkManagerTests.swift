//
//  NetworkManagerTests.swift
//  GithubReposTests
//
//  Created by eslam mohamed on 12/04/2022.
//

import XCTest
@testable import GithubRepos

class NetworkManagerTests: XCTestCase {
    
    var sut: NetworkManager!

    override func setUpWithError() throws {
        sut = NetworkManager.shared
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        sut = nil
    }

    func testFetchDataFromApi() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        let expections = expectation(description: "waiting for api response")
        sut.fetchDataFromApi(urlString: URLs.repos(), page: 1, baseModel: RepoBase.self) { result in
            switch result{
            case .success(let response):
                XCTAssertNotNil(response)
                expections.fulfill()
            case .failure(_):
                XCTFail()
            }
        }
        waitForExpectations(timeout: 5, handler: nil)
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
