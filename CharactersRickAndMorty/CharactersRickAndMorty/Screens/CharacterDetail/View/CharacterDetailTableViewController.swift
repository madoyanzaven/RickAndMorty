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
    let viewModel: CharacterDetailViewModel

    // MARK: - Initialization
    init(viewModel: CharacterDetailViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()

        setupView()
        setupDetailView()
        registerTableView()
        bind()
        viewModel.loadEpisodeList()
    }

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()

        setuptableHeaderViewFrame()
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
    
    // MARK: Private methods
    private func setupDetailView() {
        guard let selectedModel = viewModel.selectedCharacter else { return }
        detailView.setup(with: selectedModel)
    }

    private func setupView() {
        title = viewModel.navigationTitle
        view.backgroundColor = Constants.Colors.mainGray
        tableView.separatorStyle = .none
        tableView.tableHeaderView = detailView
    }

    private func setuptableHeaderViewFrame() {
        if let headerView = tableView.tableHeaderView {
            let height = headerView.systemLayoutSizeFitting(UIView.layoutFittingCompressedSize).height
            var headerFrame = headerView.frame

            //Comparison necessary to avoid infinite loop
            if height != headerFrame.size.height {
                headerFrame.size.height = height
                headerView.frame = headerFrame
                tableView.tableHeaderView = headerView
            }
        }
    }

    private func registerTableView() {
        tableView.register(UINib(nibName: reuseIdentifier, bundle: nil), forCellReuseIdentifier: reuseIdentifier)
    }
    
    private func bind() {
        viewModel.displayPublishRelay.bind { [weak self] _ in
            self?.tableView.reloadData()
        }.disposed(by: viewModel.disposeBag)
    }
}
