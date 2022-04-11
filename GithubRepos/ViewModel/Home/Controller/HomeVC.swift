//
//  HomeVC.swift
//  GithubRepos
//
//  Created by eslam mohamed on 10/04/2022.
//

import UIKit

class HomeVC: UIViewController {

    var reposTableView:UITableView!
    let viewModel = HomeViewModel()
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        configureView()
        configureReposTableView()
        updateViewWithLoadingView()
        updateViewWithData()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.setNavigationBarHidden(true, animated: true)
    }
    
    func updateViewWithData(){

        viewModel.reloadTableViewClosure = {
            print("reload table view executed")
            DispatchQueue.main.async {
            self.reposTableView.reloadData()
            }
        }

    }


    private func updateViewWithLoadingView(){
        
        viewModel.showLoadingToView = {
            print("show Loading")
//            DispatchQueue.main.async { self.showLoadingView() }
        }
        viewModel.hideLoadingToView = {
            print("hide Loading")
////            DispatchQueue.main.async { self.removeLoadingView() }
        }

    }
    
    private func configureView(){
        view.backgroundColor = .lightGray
    }
    
    private func configureReposTableView(){
        reposTableView = UITableView(frame: .zero, style: .plain)
        view.addSubview(reposTableView)
        reposTableView.register(RepoTableViewCell.self, forCellReuseIdentifier: RepoTableViewCell.reuseID)
        reposTableView.delegate   = self
        reposTableView.dataSource = self
        reposTableView.backgroundColor = .clear
        reposTableView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            reposTableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            reposTableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            reposTableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            reposTableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
    }

}


extension HomeVC:UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.numberOfCells
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: RepoTableViewCell.reuseID, for: indexPath) as! RepoTableViewCell
        cell.configureCell(cellVM: viewModel.getCellViewModel(at: indexPath))
        return cell
    }
    
    
}

extension HomeVC: UITableViewDelegate{
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 150
    }
    
    func scrollViewDidEndDragging(_ scrollView: UIScrollView, willDecelerate decelerate: Bool) {
        
        let offsetY        = scrollView.contentOffset.y
        let contentHeight  = scrollView.contentSize.height
        let height         = scrollView.frame.size.height
        
        if offsetY > contentHeight - height {
            guard viewModel.moreRepos else{return}
            viewModel.fetchData()
            
            
        }

    }
}
