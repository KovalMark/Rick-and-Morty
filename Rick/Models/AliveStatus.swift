//
//  AliveStatus.swift
//  Rick
//
//  Created by Марк Коваль on 14/11/2022.
//

import Foundation

enum AliveStatus: String {
    case alive = "Alive"
    case dead = "Dead"
    case unknown = "Unknown"
    
    init(_ status: String) {
        switch status {
        case "Alive":
            self = .alive
        case "Dead":
            self = .dead
        default:
            self = .unknown
        }
    }
}
