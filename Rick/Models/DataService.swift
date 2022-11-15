//
//  DataService.swift
//  Rick
//
//  Created by Марк Коваль on 14/11/2022.
//

import Foundation

final class DataService {
    func addData(page: Int, completion: @escaping (Result<[RickCharacter], Error>) -> Void) {
        guard let url = URL(string: Constants.Network.urlString + "\(page)") else { return }
        URLSession.shared.dataTask(with: url) { data, _, error in
            guard let data = data, error == nil else {
                completion(.failure(Constants.Errors.error))
                return
            }
            guard let result = try? JSONDecoder().decode(DataModel.self, from: data) else {
                completion(.failure(Constants.Errors.error))
                return
            }
            completion(.success(result.results))
        }
        .resume()
    }
}
