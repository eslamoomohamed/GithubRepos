//
//  HomeViewModel.swift
//  GithubRepos
//
//  Created by eslam mohamed on 10/04/2022.
//

import Foundation

class HomeViewModel:NSObject{
    
    
    let networkShared = NetworkManager.shared
    var moreRepos     = true
    var page: Int     = 1


    
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
    
    
    
    var reloadTableViewClosure:()->() = {}
    var showEmptyStateClosure:(()->()) = {}
    var showAlertMessageClosure: (()->()) = {}
    var showErrorMessageClosure: (()->()) = {}
    var showLoadingToView:  (()->()) = {}
    var hideLoadingToView: (()->())  = {}
    
    
    override init() {
        super.init()
        self.fetchData()
    }
    
    
    func fetchData(){
        self.state = .loading

        networkShared.fetchDataFromApi(urlString: URLs.repos(), page: page, baseModel: RepoBase.self) { result in
            self.state = .finished
            switch result{
            case .success(let repoBase):
                guard let items = repoBase.items else{return}
                if items.count < 30 {self.moreRepos = false}
                else{self.page += 1}
                print(items.count)
                self.processFetchedRepos(repos: items)
            case.failure(let error):
                print(error)
            }
        }
    }
    
    func getCellViewModel(at indexPath: IndexPath)->HomeCellViewModel{
        return cellViewModels[indexPath.row]
    }
    
    func createCellViewModel(item: Items)->HomeCellViewModel{
        let cellViewModel = HomeCellViewModel(imageUrl: item.owner?.avatar_url ?? "", repoTitle: item.name ?? "", repoDecription: item.description ?? "")
        
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
