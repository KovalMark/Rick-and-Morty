//
//  UIViewController+showAlert.swift
//  Rick
//
//  Created by Марк Коваль on 14/11/2022.
//

import UIKit

extension UITableViewCell {
    func showAlert() {
        let alertVC = UIAlertController(
            title: Constants.Errors.errorText,
            message: Constants.Errors.actionError,
            preferredStyle: .alert)
        
        let action = UIAlertAction(title: Constants.Errors.actionError, style: .default, handler: nil)
        alertVC.addAction(action)
    }
}
