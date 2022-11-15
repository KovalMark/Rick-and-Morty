//
//  NSObject+lock.swift
//  Rick
//
//  Created by Марк Коваль on 14/11/2022.
//

import UIKit

class Lock: NSObject {
    struct AppOrientationUtility {
        static func lockOrientation(_ orientation: UIInterfaceOrientationMask) {
            if let delegate = UIApplication.shared.delegate as? AppDelegate {
                delegate.orientationLock = orientation
            }
        }
            
        static func lockOrientation(_ orientation: UIInterfaceOrientationMask, andRotateTo rotateOrientation: UIInterfaceOrientation) {
            self.lockOrientation(orientation)
            UIDevice.current.setValue(rotateOrientation.rawValue, forKey: Constants.Strings.orientation)
        }
    }
}
