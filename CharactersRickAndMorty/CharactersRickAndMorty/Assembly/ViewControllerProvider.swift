//
//  ViewControllerProvider.swift
//  CharactersRickAndMorty
//
//  Created by Zaven Madoyan on 16.01.23.
//

import UIKit
import Swinject

enum ViewControllerProvider {}

extension ViewControllerProvider {
    enum Main {
        static var list: CharacterListTableViewController {
            let assemblies: [Assembly] = [
                CharacterListServiceAssembly(),
                CharacterListAssembly()
            ]
            let assembler = Assembler(assemblies)
            let vc = assembler.resolver.resolve(CharacterListTableViewController.self)!

            return vc
        }
    }
}
