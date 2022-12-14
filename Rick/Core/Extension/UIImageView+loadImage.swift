//
//  UIImageView+loadImage+noire.swift
//  Rick
//
//  Created by Марк Коваль on 15/11/2022.
//

import UIKit

extension UIImageView {
    func loadImage(with url: String, placeHolder: UIImage? = nil, noirStyle: Bool) {
        self.image = nil
        let imageServerUrl = url.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) ?? Constants.Strings.empty
        if let url = URL(string: imageServerUrl) {
            URLSession.shared.dataTask(with: url) { data, _, error in
                if error != nil {
                    DispatchQueue.main.async {
                        self.image = placeHolder
                    }
                    return
                }
                DispatchQueue.main.async {
                    if let data = data {
                        if let downloadImage = UIImage(data: data) {
                            if noirStyle == true {
                                self.image = downloadImage.noir
                            } else {
                                self.image = downloadImage
                            }
                        }
                    }
                }
            } .resume()
        }
    }
}
