//
//  RepoTableViewCell.swift
//  GithubRepos
//
//  Created by eslam mohamed on 10/04/2022.
//

import UIKit

class RepoTableViewCell: UITableViewCell {

    static let reuseID = "RepoTableViewCell"
    
    let containerView  = DefaultView(color: .white, raduis: 5)
    let avaterImg      = DefaultImageView(frame: .zero)
    let repoName       = DefaultTitleLabel(textAlignment: .left, fontSize: 22, fontColor: .black)
    let repoDescrption = BodyLabel(textAlignment: .left, fontSize: 16, fontColor: .black)
    let starsContainer = DefaultView(color: UIColor(red: 248/255, green: 248/255, blue: 248/255, alpha: 1), raduis: 5)
    let numOfStars     = BodyLabel(textAlignment: .center, fontSize: 12, fontColor: .black)
    let starsLabel     = BodyLabel(textAlignment: .center, fontSize: 12, fontColor: .black)
    let issueContainer = DefaultView(color: UIColor(red: 248/255, green: 248/255, blue: 248/255, alpha: 1), raduis: 5)
    let numOfIssues    = BodyLabel(textAlignment: .center, fontSize: 12, fontColor: .black)
    let issuesLabel    = BodyLabel(textAlignment: .center, fontSize: 12, fontColor: .black)
    let dateLabel      = BodyLabel(textAlignment: .center, fontSize: 15, fontColor: .black)
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        selectionStyle = .none
        
        configureContainerView()
        configureCellImage()
        configureRepoName()
        configureRepoDescrption()
        configureStartsContainer()
        configureNumOfStars()
        configureStarsLabel()
        configureIssuesContainer()
        configureNumOfIssues()
        configureIssuesLabel()
        configureDateLabel()
    }

    required init?(coder: NSCoder) { fatalError("init(coder:) has not been implemented") }
    
    func configureCell(cellVM:HomeCellViewModel){
        self.avaterImg.downloadImg(from: cellVM.imageUrl)
        self.repoName.text       = cellVM.repoTitle
        self.repoDescrption.text = cellVM.repoDecription
        self.numOfStars.text     = "\(cellVM.starsCount)"
        self.numOfIssues.text    = "\(cellVM.issuesCount)"
        self.dateLabel.text      = cellVM.date

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
//            avaterImg.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 20),
            avaterImg.centerYAnchor.constraint(equalTo: containerView.centerYAnchor),
            avaterImg.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 10),
//            avaterImg.widthAnchor.constraint(equalToConstant: 60),
            avaterImg.widthAnchor.constraint(equalTo: containerView.widthAnchor, multiplier: 0.22),
            avaterImg.heightAnchor.constraint(equalTo: self.contentView.heightAnchor, multiplier: 0.7),
//            avaterImg.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: -20)


        ])
    }
    
    private func configureRepoName(){
        containerView.addSubview(repoName)
        NSLayoutConstraint.activate([
            repoName.topAnchor.constraint(equalTo: avaterImg.topAnchor),
            repoName.leadingAnchor.constraint(equalTo: avaterImg.trailingAnchor, constant: 10),
            repoName.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -10),
        ])
    }
    
    private func configureRepoDescrption(){
        containerView.addSubview(repoDescrption)
        repoDescrption.numberOfLines = 2
        NSLayoutConstraint.activate([
            repoDescrption.topAnchor.constraint(equalTo: repoName.bottomAnchor, constant: 5),
            repoDescrption.leadingAnchor.constraint(equalTo: avaterImg.trailingAnchor, constant: 10),
            repoDescrption.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -10),
        ])
    }
    
    private func configureStartsContainer(){
        containerView.addSubview(starsContainer)
        NSLayoutConstraint.activate([
//            starsContainer.topAnchor.constraint(equalTo: repoDescrption.bottomAnchor, constant: 5),
            starsContainer.heightAnchor.constraint(equalTo: avaterImg.heightAnchor, multiplier: 0.3),
            starsContainer.leadingAnchor.constraint(equalTo: avaterImg.trailingAnchor, constant: 10),
            starsContainer.widthAnchor.constraint(equalTo: containerView.widthAnchor, multiplier: 0.22),
            starsContainer.bottomAnchor.constraint(equalTo: avaterImg.bottomAnchor)
        ])
    }
    
    private func configureNumOfStars(){
        starsContainer.addSubview(numOfStars)
        numOfStars.text = "999999"
        NSLayoutConstraint.activate([
            numOfStars.leadingAnchor.constraint(equalTo: starsContainer.leadingAnchor, constant: 5),
            numOfStars.topAnchor.constraint(equalTo: starsContainer.topAnchor, constant: 5),
            numOfStars.bottomAnchor.constraint(equalTo: starsContainer.bottomAnchor, constant: -5),
            numOfStars.trailingAnchor.constraint(equalTo: starsContainer.centerXAnchor),

        ])
    }
    
    private func configureStarsLabel(){
        starsContainer.addSubview(starsLabel)
        starsLabel.text = "Stars"
        NSLayoutConstraint.activate([
            starsLabel.leadingAnchor.constraint(equalTo: starsContainer.centerXAnchor),
            starsLabel.topAnchor.constraint(equalTo: starsContainer.topAnchor, constant: 5),
            starsLabel.bottomAnchor.constraint(equalTo: starsContainer.bottomAnchor, constant: -5),
            starsLabel.trailingAnchor.constraint(equalTo: starsContainer.trailingAnchor, constant: -5),

        ])
    }
    
    private func configureIssuesContainer(){
        containerView.addSubview(issueContainer)
        NSLayoutConstraint.activate([
            issueContainer.topAnchor.constraint(equalTo: starsContainer.topAnchor),
            issueContainer.leadingAnchor.constraint(equalTo: starsContainer.trailingAnchor, constant: 10),
            issueContainer.widthAnchor.constraint(equalTo: containerView.widthAnchor, multiplier: 0.22),
            issueContainer.bottomAnchor.constraint(equalTo: starsContainer.bottomAnchor)
        ])
    }
    
    private func configureNumOfIssues(){
        issueContainer.addSubview(numOfIssues)
        numOfIssues.text = "999999"
        NSLayoutConstraint.activate([
            numOfIssues.leadingAnchor.constraint(equalTo: issueContainer.leadingAnchor, constant: 5),
            numOfIssues.topAnchor.constraint(equalTo: issueContainer.topAnchor, constant: 5),
            numOfIssues.bottomAnchor.constraint(equalTo: issueContainer.bottomAnchor, constant: -5),
            numOfIssues.trailingAnchor.constraint(equalTo: issueContainer.centerXAnchor),

        ])
    }
    
    private func configureIssuesLabel(){
        issueContainer.addSubview(issuesLabel)
        issuesLabel.text = "Issues"
        NSLayoutConstraint.activate([
            issuesLabel.leadingAnchor.constraint(equalTo: issueContainer.centerXAnchor),
            issuesLabel.topAnchor.constraint(equalTo: issueContainer.topAnchor, constant: 5),
            issuesLabel.bottomAnchor.constraint(equalTo: issueContainer.bottomAnchor, constant: -5),
            issuesLabel.trailingAnchor.constraint(equalTo: issueContainer.trailingAnchor, constant: -5),

        ])
    }

    private func configureDateLabel(){
        containerView.addSubview(dateLabel)
        NSLayoutConstraint.activate([
            dateLabel.leadingAnchor.constraint(equalTo: issueContainer.trailingAnchor, constant: 5),
            dateLabel.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -5),
            dateLabel.centerYAnchor.constraint(equalTo: issueContainer.centerYAnchor)
        ])
    }
    

}
