//
//  RepoTableViewCell.swift
//  GithubRepos
//
//  Created by eslam mohamed on 10/04/2022.
//

import UIKit

class RepoTableViewCell: UITableViewCell {

    static let reuseID = "RepoTableViewCell"
    
    let containerView  = DefaultView(color: .white, raduis: 0)
    let avaterImg      = DefaultImageView(frame: .zero)
    let repoName       = DefaultTitleLabel(textAlignment: .left, fontSize: 18, fontColor: .black)
    let repoDescrption = BodyLabel(textAlignment: .left, fontSize: 16, fontColor: .black)
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        selectionStyle = .none
        
        configureContainerView()
        configureCellImage()
    }

    required init?(coder: NSCoder) { fatalError("init(coder:) has not been implemented") }
    
    func configureCell(cellVM:HomeCellViewModel){
        self.avaterImg.downloadImg(from: cellVM.imageUrl)
        self.repoName.text       = cellVM.repoTitle
        self.repoDescrption.text = cellVM.repoDecription
    }
    
    private func configureContainerView(){
        self.backgroundColor = .white
        contentView.addSubview(containerView)
        containerView.addBorder(color: UIColor(red: 246/255, green: 246/255, blue: 246/255, alpha: 1))
        NSLayoutConstraint.activate([
            containerView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
            containerView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 15),
            containerView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -15),
            containerView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10),
        ])
    }
    
    private func configureCellImage(){
        containerView.addSubview(avaterImg)
        avaterImg.layer.cornerRadius = 10
        avaterImg.addBorder(color: UIColor(red: 246/255, green: 246/255, blue: 246/255, alpha: 1))
        avaterImg.contentMode = .scaleAspectFill
        avaterImg.clipsToBounds = true
        NSLayoutConstraint.activate([
            avaterImg.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 20),
            avaterImg.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 10),
            avaterImg.widthAnchor.constraint(equalToConstant: 60),
            avaterImg.heightAnchor.constraint(equalTo: self.contentView.heightAnchor, multiplier: 0.5),
//            avaterImg.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: -20)


        ])
    }
    
    private func configureRepoName(){
        containerView.addSubview(repoName)
        NSLayoutConstraint.activate([
            repoName.topAnchor.constraint(equalTo: avaterImg.topAnchor, constant: 5),
            repoName.leadingAnchor.constraint(equalTo: avaterImg.trailingAnchor, constant: 10),
            repoName.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -10),
        ])
    }
    
    private func configureRepoDescrption(){
        containerView.addSubview(repoDescrption)
        NSLayoutConstraint.activate([
            repoDescrption.topAnchor.constraint(equalTo: repoName.bottomAnchor, constant: 5),
            repoDescrption.leadingAnchor.constraint(equalTo: avaterImg.trailingAnchor, constant: 10),
            repoDescrption.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -10),
        ])
    }

    

}
