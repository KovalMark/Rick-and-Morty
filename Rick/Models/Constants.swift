//
//  Constants.swift
//  Rick
//
//  Created by Марк Коваль on 14/11/2022.
//

import Foundation

enum Constants {
    
    // MARK: - Strings
    
    enum Strings {
        static let titleTable = "Characters"
        static let empty = ""
        static let watchButton = "Watch episodes"
    }
    
    // MARK: - Network
    
    enum Network {
        static let urlString = "https://rickandmortyapi.com/api/character?page="
        static let pageNumber = 1
    }
    
    // MARK: - Errors
    
    enum Errors: String, Error {
        case error = "Error"
        static let actionError = "Try again"
        static let initError = "init(coder:) has not been implemented"
        static let errorText = "The device is not connected to the Internet. Set up an internet connection and try again."
    }
}
