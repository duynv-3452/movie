//
//  TrailerCell.swift
//  Film
//
//  Created by Duy Nguyễn on 13/04/2024.
//

import UIKit

class TrailerCell: UICollectionViewCell {

    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var backDropImageView: UIImageView!
    @IBOutlet weak var playImageView: UIImageView!
    @IBOutlet weak var movieNameLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        configView()
    }
    
    private func configView() {
        containerView.layer.cornerRadius = 12
        containerView.layer.cornerCurve = .continuous
        
        backDropImageView.layer.cornerRadius = 12
        backDropImageView.layer.cornerCurve = .continuous
        
        movieNameLabel.font = .boldSystemFont(ofSize: 18)
    }
    
    func configCell(movie: Movie) {
        
    }
    
    func configSimilarCell(movie: Movie) {
        playImageView.isHidden = true
        if let path = movie.backDropPath {
            let backDropPath = Urls.shared.getImage(urlString: path)
            backDropImageView.downloadImage(fromURL: backDropPath)
        }
        movieNameLabel.text = movie.title
    }
}
