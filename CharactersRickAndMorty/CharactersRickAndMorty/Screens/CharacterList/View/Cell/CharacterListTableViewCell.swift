//
//  CharacterListTableViewCell.swift
//  CharactersRickAndMorty
//
//  Created by Zaven Madoyan on 16.01.23.
//

import UIKit
import RxSwift
import AlamofireImage

protocol Setupable {
    associatedtype SetupModel

    func setup(with model: SetupModel)
}

final class CharacterListTableViewCell: UITableViewCell {
    @IBOutlet private weak var cellContentView: UIView!
    @IBOutlet private weak var nameLabel: UILabel!
    @IBOutlet private weak var characterImageView: UIImageView!
    @IBOutlet weak var statusView: UIView!
    @IBOutlet private weak var statusInfoLabel: UILabel!

    var disposeBag = DisposeBag()

    override func awakeFromNib() {
        super.awakeFromNib()

        backgroundColor = Constants.Colors.mainGray
        cellContentView.layer.cornerRadius = 8
        cellContentView.clipsToBounds = true
        statusView.layer.cornerRadius = 5
        statusView.clipsToBounds = true
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

extension CharacterListTableViewCell: Setupable {
    typealias SetupModel = CharacterModel

    func setup(with model: SetupModel) {
        nameLabel.text = model.name
        statusInfoLabel.text = model.statusInfo
        statusView.backgroundColor = model.characterStatusColor

        guard let imageUrl = model.imageUrl else { return }

        DispatchQueue.main.async { [weak self] in
            self?.characterImageView.af.setImage(withURL: imageUrl)
        }
    }
}
