//
//  CastCell.swift
//  Film
//
//  Created by Duy Nguyễn on 12/04/2024.
//

import UIKit

final class CastCell: UICollectionViewCell {

    @IBOutlet private weak var containerView: UIView!
    @IBOutlet private weak var posterImageView: UIImageView!
    @IBOutlet private weak var castNameLabel: UILabel!
    @IBOutlet private weak var originNameLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        configView()
    }
    
    private func configView() {
        containerView.layer.cornerRadius = 12
        containerView.layer.cornerCurve = .continuous
        containerView.layer.borderWidth = 1
        containerView.layer.borderColor = UIColor.secondaryLabel.cgColor
        
        posterImageView.layer.cornerCurve = .continuous
        posterImageView.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
        posterImageView.layer.cornerRadius = 12
        posterImageView.clipsToBounds = true
        
        castNameLabel.font = .systemFont(ofSize: 18)
        castNameLabel.textColor = .secondaryLabel
        
        originNameLabel.font = .systemFont(ofSize: 12)
        originNameLabel.textColor = .secondaryLabel
        
    }
    
    func configCell(info: Cast) {
//        let posterURl = Urls.shared.getImage(urlString: info.profilePath ?? "")
//        posterImageView.downloadImage(fromURL: posterURl)
        
        if let profilePath = info.profilePath, !profilePath.isEmpty {
              let posterURl = Urls.shared.getImage(urlString: profilePath)
              posterImageView.downloadImage(fromURL: posterURl)
          } else {
              // Gán ảnh mặc định vào `posterImageView` nếu `profilePath` rỗng
              posterImageView.image = UIImage(named: "default_profile")
          }
        castNameLabel.text = info.name
        originNameLabel.text = info.originalName
        
        
    }
}
