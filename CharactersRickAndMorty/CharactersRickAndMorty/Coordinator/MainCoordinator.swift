//
//  MainCoordinator.swift
//  CharactersRickAndMorty
//
//  Created by Zaven Madoyan on 16.01.23.
//

import UIKit

final class MainCoordinator: Coordinating {
    var navigationController: UINavigationController

    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }

    func start() {
        let vc = ViewControllerProvider.Main.list
        vc.setupCoordinator(coordinator: self)
        navigationController.pushViewController(vc, animated: false)
    }

    func showAlert(with message: String) {
        let alert = UIAlertController(title: "Error",
                                      message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Ok",
                                      style: .default,
                                      handler: nil))

        navigationController.present(alert, animated: true)
    }
}
