//
//  SimilarTableViewCell.swift
//  Film
//
//  Created by Duy Nguyễn on 13/04/2024.
//

import UIKit

class SimilarTableViewCell: UITableViewCell {

    @IBOutlet weak var recommendTitle: UILabel!
    @IBOutlet weak var collectionView: UICollectionView!
    override func awakeFromNib() {
        super.awakeFromNib()
        configView()
    }
    
    private func configView() {
        
    }
}
