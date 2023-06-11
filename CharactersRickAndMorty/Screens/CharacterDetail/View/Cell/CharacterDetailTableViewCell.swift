//
//  CharacterDetailTableViewCell.swift
//  CharactersRickAndMorty
//
//  Created by Zaven Madoyan on 17.01.23.
//

import UIKit
import RxSwift
import AlamofireImage

final class CharacterDetailTableViewCell: UITableViewCell {
    @IBOutlet private weak var cellContentView: UIView!
    @IBOutlet private weak var nameLabel: UILabel!
    @IBOutlet private weak var episodeLabel: UILabel!

    var disposeBag = DisposeBag()

    override func awakeFromNib() {
        super.awakeFromNib()

        backgroundColor = Constants.Colors.mainGray
        selectionStyle = .none
        cellContentView.layer.cornerRadius = 8
        cellContentView.clipsToBounds = true
    }

    override func layoutSubviews() {
        super.layoutSubviews()

        contentView.frame = contentView.frame.inset(by: UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10))
    }

    override func prepareForReuse() {
        super.prepareForReuse()

        disposeBag = DisposeBag()
    }
}

extension CharacterDetailTableViewCell: Setupable {
    typealias SetupModel = EpisodeModel

    func setup(with model: SetupModel) {
        nameLabel.text = model.name
        episodeLabel.text = model.episode
    }
}

