//
//  CharacterListTableViewCell.swift
//  CharactersRickAndMorty
//
//  Created by Zaven Madoyan on 16.01.23.
//

import UIKit
import RxSwift

protocol Setupable {
    associatedtype SetupModel

    func setup(with model: SetupModel)
}

final class CharacterListTableViewCell: UITableViewCell {
    @IBOutlet private weak var nameLabel: UILabel!

    var disposeBag = DisposeBag()

    override func prepareForReuse() {
        super.prepareForReuse()

        disposeBag = DisposeBag()
    }
}

extension CharacterListTableViewCell: Setupable {
    typealias SetupModel = CharacterModel

    func setup(with model: SetupModel) {
        nameLabel.text = model.name
    }
}
