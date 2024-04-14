//
//  SearchCell.swift
//  Film
//
//  Created by Duy Nguyễn on 12/04/2024.
//

import UIKit

final class SearchCell: UITableViewCell {

    @IBOutlet private weak var searchView: UIView!
    @IBOutlet private weak var searchImageView: UIImageView!
    @IBOutlet private weak var searchPlaceholder: UILabel!
    @IBOutlet private weak var searchButton: UIButton!
    
    var tappedSearch: (() -> Void)?

    override func awakeFromNib() {
        super.awakeFromNib()
        configView()
    }
    
    private func configView() {
        searchView.layer.cornerRadius = 12.0
        searchView.layer.cornerCurve = .continuous
        searchPlaceholder.font = .systemFont(ofSize: 14)
        searchPlaceholder.textColor = .secondaryLabel
    }
    
    @IBAction func searchAction(_ sender: Any) {
        tappedSearch?()
    }
}
