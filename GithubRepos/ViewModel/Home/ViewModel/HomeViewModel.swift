//
//  HomeViewModel.swift
//  GithubRepos
//
//  Created by eslam mohamed on 10/04/2022.
//

import Foundation

class HomeViewModel{
    
    var networkShared:NetworkManager?
    var moreRepos:Bool?
    var page:Int?


    
    private var cellViewModels:[HomeCellViewModel] = [HomeCellViewModel](){
        didSet{
            self.reloadTableViewClosure()
        }
    }
    
    private var errorMessage:ErrorMessages!{
        didSet{
            self.showErrorMessageClosure()
        }
    }
    
    var state:State = .empty{
        didSet{
            switch state{
            case .loading:
                self.showLoadingToView()
            case .finished:
                self.hideLoadingToView()

            default:
                self.showLoadingToView()
            }
        }
    }
    
    var numberOfCells:Int{
        return cellViewModels.count
    }
    
    
    
    var reloadTableViewClosure:()->()     = {}
    var showEmptyStateClosure:(()->())    = {}
    var showAlertMessageClosure: (()->()) = {}
    var showErrorMessageClosure: (()->()) = {}
    var showLoadingToView:  (()->())      = {}
    var hideLoadingToView: (()->())       = {}
    
    
    init(networkShared:NetworkManager? = NetworkManager.shared,moreRepos:Bool? = true,page:Int? = 1) {
        self.networkShared = networkShared
        self.moreRepos     = moreRepos
        self.page          = page
//        self.fetchData()
    }
    static var count = 1
    func fetchData(){
        self.state = .loading
        guard var moreRepos     = moreRepos else { return }
        guard let page          = page else { return }
        guard let networkShared = networkShared else { return }
        if moreRepos{
            networkShared.fetchDataFromApi(urlString: URLs.repos(), page: HomeViewModel.count, baseModel: RepoBase.self) { result in
                self.state = .finished
                switch result{
                case .success(let repoBase):
                    guard let items = repoBase.items else{return}
                    if items.count < repoBase.total_count ?? 30 {HomeViewModel.count += page;moreRepos = true}
                    else{moreRepos = false}
                    print(items.count)
                    self.processFetchedRepos(repos: items)
                case.failure(let error):
                    print(error)
                }
            }
        }
    }
    
    func getCellViewModel(at indexPath: IndexPath)->HomeCellViewModel{
        return cellViewModels[indexPath.row]
    }
    
    func createCellViewModel(item: Items)->HomeCellViewModel{
        let cellViewModel = HomeCellViewModel(imageUrl: item.owner?.avatar_url ?? "", repoTitle: item.name ?? "", repoDecription: item.description ?? "No Description",issuesCount: item.open_issues_count ?? 0,starsCount: item.stargazers_count ?? 0,date: item.created_at?.convertDateToDisplay() ?? "")
        return cellViewModel
    }
    
    func processFetchedRepos(repos:[Items]){
        var cellVM = [HomeCellViewModel]()
        for itme in repos {
            cellVM.append(createCellViewModel(item: itme))
        }
        self.cellViewModels.append(contentsOf: cellVM)
    }
    
    
}
