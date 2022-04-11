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
}
