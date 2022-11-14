//
//  StartViewController.swift
//  Rick
//
//  Created by Марк Коваль on 14/11/2022.
//

import UIKit

final class StartViewController: UIViewController {
    
    // MARK: - Properties
    
    var characters: [RickCharacter] = []
    private let service = DataService()
    
    let activityIndicator: UIActivityIndicatorView = {
        let indicator = UIActivityIndicatorView()
        indicator.color = .black
        indicator.hidesWhenStopped = true
        indicator.transform = CGAffineTransform(scaleX: 2, y: 2)
        indicator.translatesAutoresizingMaskIntoConstraints = false
        return indicator
    }()
    
    private let titleTable: UILabel = {
        let label = UILabel()
        label.text = Constants.Strings.titleTable
        label.font = UIFont.systemFont(ofSize: 31)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let personTableView: UITableView = {
        let table = UITableView()
        table.register(CharacterTableViewCell.self, forCellReuseIdentifier: CharacterTableViewCell.identifier)
        table.backgroundColor = .basicWhite
        table.separatorColor = .basicWhite
        table.showsVerticalScrollIndicator = false
        table.translatesAutoresizingMaskIntoConstraints = false
        return table
    }()
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        activityIndicator.startAnimating()
        setupView()
        setupConstraints()
        configData()
    }
    
    // MARK: - Private methods
    
    private func configData() {
        activityIndicator.startAnimating()
        service.addData(page: Constants.Network.pageNumber) { [weak self] result in
            switch result {
            case .success(let data):
                self?.characters.append(contentsOf: data)
                DispatchQueue.main.async {
                    self?.activityIndicator.stopAnimating()
                    self?.personTableView.reloadData()
                }
            case .failure(let error):
                print("error is \(error)")
            }
        }
    }
    
    private func setupView() {
        view.backgroundColor = .basicWhite
        view.addSubview(activityIndicator)
        view.addSubview(titleTable)
        view.addSubview(personTableView)
        personTableView.delegate = self
        personTableView.dataSource = self
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            activityIndicator.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            activityIndicator.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            
            titleTable.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 24),
            titleTable.topAnchor.constraint(equalTo: view.topAnchor, constant: 90),
            titleTable.rightAnchor.constraint(equalTo: view.rightAnchor, constant: 230),
            
            personTableView.leftAnchor.constraint(equalTo: view.leftAnchor),
            personTableView.topAnchor.constraint(equalTo: titleTable.bottomAnchor, constant: 24),
            personTableView.rightAnchor.constraint(equalTo: view.rightAnchor),
            personTableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
    }
}
