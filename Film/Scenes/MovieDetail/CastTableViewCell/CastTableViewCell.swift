//
//  CastTableViewCell.swift
//  Film
//
//  Created by Duy Nguyễn on 13/04/2024.
//

import UIKit

class CastTableViewCell: UITableViewCell {

    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var castTitle: UILabel!
    @IBOutlet weak var collectionView: UICollectionView!
    override func awakeFromNib() {
        super.awakeFromNib()
        configView()
    }
    
    private func configView() {

        
    }
}
