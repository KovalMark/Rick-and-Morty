//
//  StartViewController+UITableViewDataSource.swift
//  Rick
//
//  Created by Марк Коваль on 14/11/2022.
//

import UIKit

extension StartViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return characters.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: CharacterTableViewCell.identifier, for: indexPath) as? CharacterTableViewCell else { return UITableViewCell() }
        let characters = characters[indexPath.row]
        
        cell.nameLabel.text = characters.name
        cell.speciesLabel.text = characters.species + Constants.Strings.comma
        cell.genderLabel.text = characters.gender
        cell.locationLabel.text = characters.location.name
        cell.statusLabel.text = characters.status
        
        if cell.statusLabel.text == Constants.Strings.aliveDown {
            cell.avatarImage.loadImage(with: characters.image, noirStyle: false)
            cell.statusLabel.textColor = .textGreen
            cell.statusLabel.backgroundColor = .backgroundGreen
            cell.statusLabel.text = Constants.Strings.aliveUp
        } else if cell.statusLabel.text == Constants.Strings.deadDown {
            cell.avatarImage.loadImage(with: characters.image, noirStyle: true)
            cell.statusLabel.textColor = .textRed
            cell.statusLabel.backgroundColor = .backgroundRed
            cell.statusLabel.text = Constants.Strings.deadUp
        } else {
            cell.avatarImage.loadImage(with: characters.image, noirStyle: false)
            cell.statusLabel.textColor = .textGray
            cell.statusLabel.backgroundColor = .backgroundGray
            cell.statusLabel.text = Constants.Strings.unknownUp
        }
        return cell
    }
}
