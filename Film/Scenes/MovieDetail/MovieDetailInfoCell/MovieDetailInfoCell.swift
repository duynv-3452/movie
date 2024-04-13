//
//  MovieDetailInfoCell.swift
//  Film
//
//  Created by Duy Nguyễn on 12/04/2024.
//

import UIKit

final class MovieDetailInfoCell: UITableViewCell {

    @IBOutlet private weak var backDropImageView: UIImageView!
    @IBOutlet private weak var posterImageView: UIImageView!
    @IBOutlet private weak var movieNameLabel: UILabel!
    @IBOutlet private weak var timeLabel: UILabel!
    @IBOutlet private weak var favoriteButton: UIButton!
    @IBOutlet private weak var rateView: UIView!
    @IBOutlet private weak var overviewTitle: UILabel!
    @IBOutlet private weak var descriptionLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        configView()
    }
    
    private func configView() {
        posterImageView.layer.cornerRadius = 12
        posterImageView.layer.cornerCurve = .continuous
        posterImageView.layer.borderColor = UIColor.white.cgColor
        posterImageView.layer.borderWidth = 3
        
        movieNameLabel.font = .boldSystemFont(ofSize: 20)
        movieNameLabel.textColor = .white
        
        overviewTitle.font = .boldSystemFont(ofSize: 20)
        descriptionLabel.textColor = .secondaryLabel
        descriptionLabel.font = .systemFont(ofSize: 16)
    }
    
    func configCell(movie: Movie) {
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.01) { [weak self] in
            let backDropUrl = Urls.shared.getImage(urlString: movie.backDropPath ?? "")
            self?.backDropImageView.downloadImage(fromURL: backDropUrl)
            let posterUrl = Urls.shared.getImage(urlString: movie.poster ?? "")
            self?.posterImageView.downloadImage(fromURL: posterUrl)
            self?.movieNameLabel.text = movie.title
            self?.timeLabel.text = "Run time: \(movie.runtime ?? 0)"
            self?.descriptionLabel.text = movie.overview

        }
    }
}
