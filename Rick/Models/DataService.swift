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
        
        let dataTask = URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                print("error is \(error)")
                return
            }
            
            guard let httpResponse = response as? HTTPURLResponse,
                  (200..<300).contains(httpResponse.statusCode),
                  let data = data else {
                return
            }
            
            do {
                let characterModel = try JSONDecoder().decode(DataModel.self, from: data)
                DispatchQueue.main.async {
                    completion(.success(characterModel.results))
                }
            } catch {
                DispatchQueue.main.async {
                    completion(.failure(error))
                }
            }
        }
        dataTask.resume()
    }
}
