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
        setupView()
        setupConstraints()
        configData()
    }
    
    // MARK: - Private methods
    
    private func configData() {
        service.addData(page: Constants.Network.pageNumber) { [weak self] result in
            switch result {
            case .success(let data):
                self?.characters.append(contentsOf: data)
                DispatchQueue.main.async {
                    self?.personTableView.reloadData()
                }
            case .failure(let error):
                print("error is \(error)")
            }
        }
    }
    
    private func setupView() {
        view.backgroundColor = .basicWhite
        view.addSubview(titleTable)
        view.addSubview(personTableView)
        personTableView.delegate = self
        personTableView.dataSource = self
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
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
