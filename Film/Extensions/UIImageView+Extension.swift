//
//  UIImageView+Extension.swift
//  Film
//
//  Created by Duy Nguyễn on 12/04/2024.
//

import UIKit

extension UIImageView {
    func downloadImage(fromURL url: String) {
        APICaller.shared.downloadImage(urlString: url) { [weak self] image in
            guard let self = self else { return }
            DispatchQueue.main.async {
                self.image = image
            }
        }
    }
}
