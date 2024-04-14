//
//  UIViewController+Extension.swift
//  Film
//
//  Created by Duy Nguyễn on 14/04/2024.
//

import UIKit

extension UIViewController {
    func loading(_ isShow: Bool) {
           DispatchQueue.main.async {
               let activityIndicator = UIActivityIndicatorView(style: .large)
               activityIndicator.color = .darkGray
               activityIndicator.translatesAutoresizingMaskIntoConstraints = false

               if isShow {
                   self.view.addSubview(activityIndicator)
                   activityIndicator.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
                   activityIndicator.centerYAnchor.constraint(equalTo: self.view.centerYAnchor).isActive = true
                   activityIndicator.startAnimating()
               } else {
                   let indicator = self.view.subviews.first(where: { $0.isKind(of: UIActivityIndicatorView.self) })
                   indicator?.removeFromSuperview()
               }
           }
       }
}

