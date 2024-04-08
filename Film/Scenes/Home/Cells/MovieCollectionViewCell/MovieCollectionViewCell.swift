//
//  MovieCollectionViewCell.swift
//  Film
//
//  Created by nguyen.van.duyb on 4/5/24.
//

import UIKit

class MovieCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var posterImage: UIImageView!
    @IBOutlet weak var movieName: UILabel!
    @IBOutlet weak var releaseDate: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        configView()
    }
    
    private func configView() {
        posterImage.image = UIImage(named: "anh_app")
        posterImage.layer.cornerRadius = 12
        posterImage.contentMode = .scaleAspectFill
        movieName.font = .systemFont(ofSize: 18)
        releaseDate.font = .systemFont(ofSize: 12)
        releaseDate.textColor = .secondaryLabel
    }
    
    func configCell(movie: Movie) {
        movieName.text = movie.title
        releaseDate.text = movie.releaseDate
        let posterImageString = Urls.shared.getImage(urlString: movie.poster ?? "")
        let posterURL = URL(string: posterImageString)
    }
}
