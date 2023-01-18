//
//  DetailView.swift
//  CharactersRickAndMorty
//
//  Created by Zaven Madoyan on 18.01.23.
//

import UIKit

final class DetailView: UIView {
    @IBOutlet private weak var nameLabel: UILabel!
    @IBOutlet private weak var characterImageView: UIImageView!
    @IBOutlet private weak var statusView: UIView!
    @IBOutlet private weak var statusInfoLabel: UILabel!
    @IBOutlet private weak var locationNameLabel: UILabel!
    @IBOutlet private weak var origineNameLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        backgroundColor = Constants.Colors.mainGray
        statusView.layer.cornerRadius = 5
        statusView.clipsToBounds = true
    }
}

extension DetailView: Setupable {
    typealias SetupModel = CharacterModel

    func setup(with model: SetupModel) {
        nameLabel.text = model.name
        statusInfoLabel.text = model.statusInfo
        statusView.backgroundColor = model.characterStatusColor
        locationNameLabel.text = model.locationName
        origineNameLabel.text = model.origineName

        guard let imageUrl = model.imageUrl else { return }

        characterImageView.af.setImage(
            withURL: imageUrl,
            placeholderImage: Constants.Images.noImage)
    }
}



