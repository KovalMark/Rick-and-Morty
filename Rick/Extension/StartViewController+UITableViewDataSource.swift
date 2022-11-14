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
        cell.speciesLabel.text = characters.species + ", "
        cell.genderLabel.text = characters.gender
        cell.locationLabel.text = characters.location.name
        cell.statusLabel.text = characters.status
        
        if cell.statusLabel.text == "Alive" {
            cell.avatarImage.loadImage(with: characters.image)
            cell.statusLabel.textColor = .textGreen
            cell.statusLabel.backgroundColor = .backgroundGreen
            cell.statusLabel.text = "ALIVE"
        } else if cell.statusLabel.text == "Dead" {
            cell.avatarImage.loadImageNoire(with: characters.image)
            cell.statusLabel.textColor = .textRed
            cell.statusLabel.backgroundColor = .backgroundRed
            cell.statusLabel.text = "DEAD"
        } else {
            cell.avatarImage.loadImage(with: characters.image)
            cell.statusLabel.textColor = .textGray
            cell.statusLabel.backgroundColor = .backgroundGray
            cell.statusLabel.text = "UNKNOWN"
        }
        return cell
    }
}
