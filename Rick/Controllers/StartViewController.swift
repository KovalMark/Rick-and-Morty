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
    private let titleTable = CustomLabel(frame: .zero)
    
    let activityIndicator: UIActivityIndicatorView = {
        let indicator = UIActivityIndicatorView()
        indicator.color = .black
        indicator.hidesWhenStopped = true
        indicator.transform = CGAffineTransform(scaleX: 2, y: 2)
        indicator.translatesAutoresizingMaskIntoConstraints = false
        return indicator
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
        activityIndicator.startAnimating()
        service.addData(page: Constants.Network.pageNumber) { [weak self] result in
            switch result {
            case .success(let decodeData):
                self?.characters = decodeData
                DispatchQueue.main.async {
                    self?.activityIndicator.stopAnimating()
                    self?.personTableView.reloadData()
                }
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    
    private func setupView() {
        view.backgroundColor = .basicWhite
        view.addSubview(activityIndicator)
        view.addSubview(titleTable)
        titleTable.text = Constants.Strings.titleTable
        titleTable.font = UIFont.systemFont(ofSize: 31)
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
