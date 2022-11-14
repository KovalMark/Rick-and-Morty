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
        
        cell.avatarImage.loadImage(with: characters.image)
        cell.nameLabel.text = characters.name
        cell.speciesLabel.text = characters.species + ", "
        cell.genderLabel.text = characters.gender
        cell.locationLabel.text = characters.location.name
//        cell.aliveStatusLabel.text = characters.statusxr
        
        return cell
    }
}
