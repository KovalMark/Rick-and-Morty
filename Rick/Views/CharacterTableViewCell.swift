//
//  CharacterTableViewCell.swift
//  Rick
//
//  Created by Марк Коваль on 14/11/2022.
//

import UIKit

final class CharacterTableViewCell: UITableViewCell {
    
    static let identifier = "characterCell"
    
    let avatarImage: UIImageView = {
        let characterImageView = UIImageView()
        characterImageView.clipsToBounds = true
        characterImageView.layer.cornerRadius = 40
        characterImageView.translatesAutoresizingMaskIntoConstraints = false
        return characterImageView
    }()
    
    let nameLabel: UILabel = {
        let label = UILabel()
        label.textColor = .basicBlack
        label.font = UIFont.systemFont(ofSize: 21)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let speciesLabel: UILabel = {
        let label = UILabel()
        label.textColor = .basicBlack
        label.font = UIFont.systemFont(ofSize: 17)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let genderLabel: UILabel = {
        let label = UILabel()
        label.textColor = .basicBlack
        label.font = UIFont.systemFont(ofSize: 17)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let watchButton: UIButton = {
        var filled = UIButton.Configuration.filled()
        filled.title = Constants.Strings.watchButton
        filled.buttonSize = .small
        filled.baseBackgroundColor = .backgroundOrange
        filled.baseForegroundColor = .textOrange
        filled.image = .play
        filled.imagePlacement = .leading
        filled.imagePadding = 5
        let button = UIButton(configuration: filled)
        button.clipsToBounds = true
        button.layer.cornerRadius = 17
        button.addTarget(self, action: #selector(tapWatchButton), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    let locationImage: UIImageView = {
        let locationImage = UIImageView()
        locationImage.image = .location
        locationImage.translatesAutoresizingMaskIntoConstraints = false
        return locationImage
    }()
    
    let locationLabel: UILabel = {
        let label = UILabel()
        label.textColor = .textGray
        label.font = UIFont.systemFont(ofSize: 12)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupView()
        setupConstraints()
    }

    required init?(coder: NSCoder) {
        fatalError(Constants.Errors.initError)
    }
    
    @objc private func tapWatchButton() {
        showAlert()
    }
    
    private func setupView() {
        contentView.addSubview(avatarImage)
        contentView.addSubview(nameLabel)
        contentView.addSubview(speciesLabel)
        contentView.addSubview(genderLabel)
        contentView.addSubview(watchButton)
        contentView.addSubview(locationImage)
        contentView.addSubview(locationLabel)
//        contentView.addSubview(aliveStatusLabel)
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            avatarImage.heightAnchor.constraint(equalToConstant: 120),
            avatarImage.widthAnchor.constraint(equalToConstant: 120),
            avatarImage.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 24),
            
            nameLabel.leftAnchor.constraint(equalTo: avatarImage.rightAnchor, constant: 18),
            nameLabel.topAnchor.constraint(equalTo: contentView.topAnchor),
            
            speciesLabel.leftAnchor.constraint(equalTo: avatarImage.rightAnchor, constant: 18),
            speciesLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 4),
            
            genderLabel.leftAnchor.constraint(equalTo: speciesLabel.rightAnchor, constant: 1),
            genderLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 4),
            
            watchButton.leftAnchor.constraint(equalTo: avatarImage.rightAnchor, constant: 18),
            watchButton.topAnchor.constraint(equalTo: speciesLabel.bottomAnchor, constant: 12),
            watchButton.heightAnchor.constraint(equalToConstant: 35),
            watchButton.widthAnchor.constraint(equalToConstant: 148),
            
            locationImage.leftAnchor.constraint(equalTo: avatarImage.rightAnchor, constant: 18),
            locationImage.topAnchor.constraint(equalTo: watchButton.bottomAnchor, constant: 12),
            
            locationLabel.leftAnchor.constraint(equalTo: locationImage.rightAnchor, constant: 8),
            locationLabel.topAnchor.constraint(equalTo: watchButton.bottomAnchor, constant: 12),
            
//            aliveStatusLabel.leftAnchor.constraint(equalTo: nameLabel.rightAnchor, constant: 49),
//            aliveStatusLabel.topAnchor.constraint(equalTo: contentView.topAnchor),
//            aliveStatusLabel.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: 24),
            
        ])
    }
}
