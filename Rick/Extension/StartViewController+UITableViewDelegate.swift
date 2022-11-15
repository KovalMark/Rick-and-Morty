//
//  StartViewController+UITableViewDelegate.swift
//  Rick
//
//  Created by Марк Коваль on 14/11/2022.
//

import UIKit

extension StartViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return CGFloat(Constants.Network.heightForRowAt)
    }
}
