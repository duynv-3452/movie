//
//  MovieHeader.swift
//  Film
//
//  Created by nguyen.van.duyb on 4/5/24.
//

import UIKit

final class MovieHeader: UITableViewHeaderFooterView {

    @IBOutlet private weak var containerView: UIView!
    @IBOutlet private weak var headerTitle: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        configView()
    }
    
    private func configView() {
        
    }
    
    func configView(title: String) {
        headerTitle.text = title
    }
}