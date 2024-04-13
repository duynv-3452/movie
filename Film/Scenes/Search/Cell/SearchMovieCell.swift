//
//  SearchMovieCell.swift
//  Film
//
//  Created by Duy Nguyễn on 13/04/2024.
//

import UIKit

class SearchMovieCell: UITableViewCell {
    
    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var movieImageView: UIImageView!
    @IBOutlet weak var movieNameLabel: UILabel!
    @IBOutlet weak var releaseDateLabel: UILabel!
    @IBOutlet weak var rateView: UIView!
    @IBOutlet weak var rateLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        configView()
    }

    private func configView() {
        containerView.layer.cornerRadius = 12
        containerView.layer.cornerCurve = .continuous
        movieImageView.layer.cornerRadius = 12
        rateView.layer.cornerRadius = 4
    }
    
    func configCell(movie: Movie) {
        if let path = movie.poster {
            let movieImagePath = Urls.shared.getImage(urlString: path)
            movieImageView.downloadImage(fromURL: movieImagePath)
        }
        movieNameLabel.text = movie.title
        releaseDateLabel.text = movie.releaseDate
    }
}
