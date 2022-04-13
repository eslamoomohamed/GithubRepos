//
//  HomeVC.swift
//  GithubRepos
//
//  Created by eslam mohamed on 10/04/2022.
//

import UIKit

class HomeVC: UIViewController {

    private var reposTableView:UITableView!
    private var viewModel:HomeViewModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureView()
        configureReposTableView()
        updateViewWithLoadingView()
        updateViewWithData()
        guard let viewModel = viewModel else { return }
        viewModel.fetchData()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.setNavigationBarHidden(true, animated: true)
    }
    
    init(viewModel:HomeViewModel? = HomeViewModel()){
        super.init(nibName: nil, bundle: nil)
        self.viewModel = viewModel
    }
    
    required init?(coder: NSCoder) { fatalError("init(coder:) has not been implemented") }
    
    func updateViewWithData(){
        guard let viewModel              = viewModel else { return }
        viewModel.reloadTableViewClosure = { DispatchQueue.main.async { self.reposTableView.reloadData() } }
    }

    private func updateViewWithLoadingView(){
        guard let viewModel         = viewModel else { return }
        viewModel.showLoadingToView = { DispatchQueue.main.async { self.showLoadingView() } }
        viewModel.hideLoadingToView = { DispatchQueue.main.async { self.removeLoadingView() } }
    }
    
    private func configureView(){ view.backgroundColor = .white }
    
    private func configureReposTableView(){
        reposTableView = UITableView(frame: .zero, style: .plain)
        view.addSubview(reposTableView)
        reposTableView.register(RepoTableViewCell.self, forCellReuseIdentifier: RepoTableViewCell.reuseID)
        reposTableView.delegate        = self
        reposTableView.dataSource      = self
        reposTableView.backgroundColor = .clear
        reposTableView.separatorStyle  = .none
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
        guard let viewModel = viewModel else { return 0 }
        return viewModel.numberOfCells
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: RepoTableViewCell.reuseID, for: indexPath) as! RepoTableViewCell
        guard let viewModel = viewModel else { return cell }
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
            guard let viewModel = viewModel else { return }
            guard let moreRepos = viewModel.moreRepos else{return}
            if moreRepos{ viewModel.fetchData() } else{return}
        }
    }
    
}
