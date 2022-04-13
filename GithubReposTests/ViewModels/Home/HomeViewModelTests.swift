//
//  HomeViewModelTests.swift
//  GithubReposTests
//
//  Created by eslam mohamed on 12/04/2022.
//

import XCTest
@testable import GithubRepos

class HomeViewModelTests: XCTestCase {

    var sutForCreateCellViewModel:HomeViewModel!
    var homeCellVMForCreateCellViewModel:HomeCellViewModel!
    var mockDataForCreateCellViewModel:NetworkMock!
    var sutForProcessFetchedRepos:HomeViewModel!
    var homeCellVMForProcessFetchedRepos:HomeCellViewModel!
    var mockDataForProcessFetchedRepos:NetworkMock!
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        sutForCreateCellViewModel        = HomeViewModel()
        homeCellVMForCreateCellViewModel = HomeCellViewModel(imageUrl: "https://avatars.githubusercontent.com/u/3531955?v=4", repoTitle: "react-native-motion", repoDecription: "Animate it! Easily!", issuesCount: 15, starsCount: 2016, date: "2018-03-19")
        mockDataForCreateCellViewModel   = NetworkMock(responseError: false)
        
        sutForProcessFetchedRepos        = HomeViewModel()
        homeCellVMForProcessFetchedRepos = HomeCellViewModel(imageUrl: "https://avatars.githubusercontent.com/u/3531955?v=4", repoTitle: "react-native-motion", repoDecription: "Animate it! Easily!", issuesCount: 15, starsCount: 2016, date: "2018-03-19")
        mockDataForProcessFetchedRepos   = NetworkMock(responseError: false)
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        sutForCreateCellViewModel        = nil
        homeCellVMForCreateCellViewModel = nil
        mockDataForCreateCellViewModel   = nil
        sutForProcessFetchedRepos        = nil
        homeCellVMForProcessFetchedRepos = nil
        mockDataForProcessFetchedRepos   = nil
    }

    func testCreateCellViewModel() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        mockDataForCreateCellViewModel.fetchDataFromApi(urlString: "", page: 1, baseModel: RepoBase.self) { result in
            switch result{
            case .success(let repoBase):
                guard let items = repoBase.items else{return}
                //items[1]
                let cellVM = self.sutForCreateCellViewModel.createCellViewModel(item: items[0])
                XCTAssert(cellVM == self.homeCellVMForCreateCellViewModel)
            case .failure(let error):
                print(error)
                XCTFail()
            }
        }
    }


    func testProcessFetchedReposFunc() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        mockDataForProcessFetchedRepos.fetchDataFromApi(urlString: "", page: 1, baseModel: RepoBase.self) { result in
            switch result{
            case .success(let repoBase):
                guard let items = repoBase.items else{return}
                self.sutForProcessFetchedRepos.processFetchedRepos(repos: items)
                //IndexPath(row: 1, section: 0)
                XCTAssertTrue(self.sutForProcessFetchedRepos.getCellViewModel(at: IndexPath(row: 0, section: 0)) == self.homeCellVMForProcessFetchedRepos)
            case .failure(let error):
                print(error)
                XCTFail()
            }
        }
    }


}
