//
//  ActorInfoCell.swift
//  Film
//
//  Created by nguyen.van.duyb on 4/16/24.
//

import UIKit

class ActorInfoCell: UITableViewCell {

    @IBOutlet weak var backdropImage: UIImageView!
    @IBOutlet weak var posterImage: UIImageView!
    @IBOutlet weak var actorBigo: UILabel!
    @IBOutlet weak var actorName: UILabel!
    @IBOutlet weak var actorDate: UILabel!
    @IBOutlet weak var actorKnownAs: UILabel!
    @IBOutlet weak var actorPlace: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        configView()
    }
    
    private func configView() {
        actorBigo.numberOfLines = 4
        posterImage.layer.cornerRadius = 12
        posterImage.layer.cornerCurve = .continuous
        posterImage.layer.borderColor = UIColor.white.cgColor
        posterImage.layer.borderWidth = 3
    }
    
    func configCell(actor: Actor) {
        actorBigo.text = actor.biography
        actorDate.text = actor.birthday
        actorName.text = actor.name
        actorKnownAs.text = actor.knownFor
        actorPlace.text = actor.place
        let posterImageString = Urls.shared.getImage(urlString: actor.profilePath ?? "")
        posterImage.downloadImage(fromURL: posterImageString)
        backdropImage.downloadImage(fromURL: posterImageString)

        
    }
}
