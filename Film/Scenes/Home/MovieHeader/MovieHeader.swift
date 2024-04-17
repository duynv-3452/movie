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
    var showMoreTapped: (() -> Void)?
    override func awakeFromNib() {
        super.awakeFromNib()
        configView()
    }
    
    private func configView() {
        headerTitle.font = .boldSystemFont(ofSize: 22)
    }
    
    func configView(title: String) {
        headerTitle.text = title
    }
    
    @IBAction func tappedShowMore(_ sender: Any) {
        showMoreTapped?()
    }
}
