//
//  HomeViewModelTests.swift
//  GithubReposTests
//
//  Created by eslam mohamed on 12/04/2022.
//

import XCTest
@testable import GithubRepos

class HomeViewModelTests: XCTestCase {

    var sut:HomeViewModel!
    var network:NetworkManager!
    var homeCellVM:HomeCellViewModel!
    var mockData:NetworkMock!
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        sut        = HomeViewModel()
        network    = NetworkManager.shared
        homeCellVM = HomeCellViewModel(imageUrl: "https://avatars.githubusercontent.com/u/3531955?v=4", repoTitle: "react-native-motion", repoDecription: "Animate it! Easily!", issuesCount: 15, starsCount: 2016, date: "2018-03-19")
        mockData   = NetworkMock(responseError: false)
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        sut        = nil
        network    = nil
        homeCellVM = nil
        mockData   = nil
    }

    func testCreateCellViewModel() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        mockData.fetchDataFromApi(urlString: "", page: 1, baseModel: RepoBase.self) { result in
            switch result{
            case .success(let repoBase):
                guard let items = repoBase.items else{return}
                //items[1]
                let cellVM = self.sut.createCellViewModel(item: items[0])
                XCTAssert(cellVM == self.homeCellVM)
            case .failure(let error):
                print(error)
                XCTFail()
            }
        }
    }


    func testProcessFetchedReposFunc() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        mockData.fetchDataFromApi(urlString: "", page: 1, baseModel: RepoBase.self) { result in
            switch result{
            case .success(let repoBase):
                guard let items = repoBase.items else{return}
                self.sut.processFetchedRepos(repos: items)
                //IndexPath(row: 1, section: 0)
                XCTAssertTrue(self.sut.getCellViewModel(at: IndexPath(row: 0, section: 0)) == self.homeCellVM)
            case .failure(let error):
                print(error)
                XCTFail()
            }
        }
    }


}
