//
//  Coordinating.swift
//  CharactersRickAndMorty
//
//  Created by Zaven Madoyan on 16.01.23.
//

import UIKit

protocol Coordinating {
    var navigationController: UINavigationController { get set }

    func start()
}
