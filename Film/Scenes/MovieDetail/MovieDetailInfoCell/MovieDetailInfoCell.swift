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
        
    }
    
    func configCell() {
        
    }
}
