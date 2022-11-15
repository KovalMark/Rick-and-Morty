//
//  CustomLabel.swift
//  Rick
//
//  Created by Марк Коваль on 15/11/2022.
//

import UIKit

final class CustomLabel: UILabel {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        textColor = .basicBlack
        adjustsFontSizeToFitWidth = true
        setContentCompressionResistancePriority(.defaultLow, for: .horizontal)
        font = UIFont.systemFont(ofSize: 17)
        translatesAutoresizingMaskIntoConstraints = false
    }
    
    required init?(coder: NSCoder) {
        fatalError(Constants.Errors.initError)
    }
}
