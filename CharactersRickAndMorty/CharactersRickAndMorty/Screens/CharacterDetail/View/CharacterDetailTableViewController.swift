//
//  CharacterDetailTableViewController.swift
//  CharactersRickAndMorty
//
//  Created by Zaven Madoyan on 17.01.23.
//

import UIKit
import RxCocoa
import RxSwift

final class CharacterDetailTableViewController: UITableViewController {
    // MARK: - Properties
    private let reuseIdentifier = "CharacterDetailTableViewCell"
    private let detailView: DetailView = DetailView.fromNib()
    private let heightForHeader: CGFloat = 440
    private let heightForRow: CGFloat = 110

    // MARK: - Dependencies
    private let viewModel: CharacterDetailViewModel

    // MARK: - Initialization
    init(viewModel: CharacterDetailViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Setup
    func setup(coordinator: MainCoordinator, charachterModel: CharacterModel) {
        viewModel.setup(with: charachterModel, coordinator)
        detailView.setup(with: charachterModel)
    }

    // MARK: Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()

        setupView()
        registerTableView()
        bind()
        viewModel.loadEpisodeList()
    }

    // MARK: UITableViewDataSource & UITableViewDelegate
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.episodesModel.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: reuseIdentifier) as? CharacterDetailTableViewCell
        if let currentCharacter = viewModel.episodesModel[safe: indexPath.row] {
            cell?.setup(with: currentCharacter)
        }

        return cell ?? UITableViewCell()
    }

    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return heightForRow
    }

    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return heightForHeader
    }

    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        return detailView
    }
    
    // MARK: Private methods
    private func setupView() {
        title = viewModel.navigationTitle
    }

    private func registerTableView() {
        tableView.register(UINib(nibName: reuseIdentifier, bundle: nil), forCellReuseIdentifier: reuseIdentifier)
        tableView.separatorStyle = .none
    }

    private func bind() {
        viewModel.displayPublishRelay.bind { [weak self] _ in
            self?.tableView.reloadData()
        }.disposed(by: viewModel.disposeBag)
    }
}
