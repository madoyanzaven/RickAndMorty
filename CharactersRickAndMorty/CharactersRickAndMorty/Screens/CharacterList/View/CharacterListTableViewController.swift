//
//  CharacterListTableViewController.swift
//  CharactersRickAndMorty
//
//  Created by Zaven Madoyan on 16.01.23.
//

import UIKit
import RxCocoa
import RxSwift

final class CharacterListTableViewController: UITableViewController {
    private let reuseIdentifier = "CharacterListTableViewCell"
    
    // MARK: - Dependencies
    private let viewModel: CharacterListViewModel
    
    // MARK: - Initialization
    init(viewModel: CharacterListViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupCoordinator(coordinator: MainCoordinator) {
        viewModel.coordinator = coordinator
    }
    
    // MARK: Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupView()
        registerTableView()
        bind()
        viewModel.loadCharacterList()
    }
    
    // MARK: UITableViewDataSource & UITableViewDelegate
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.charactersModel.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: reuseIdentifier) as? CharacterListTableViewCell
        if let currentCharacter = viewModel.charactersModel[safe: indexPath.row] {
            cell?.setup(with: currentCharacter)
        }
        
        return cell ?? UITableViewCell()
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    // MARK: - UIScrollViewDelegate
    override func scrollViewDidEndDragging(_ scrollView: UIScrollView, willDecelerate decelerate: Bool) {
        guard !decelerate else { return }
        
        fetchDataWhileScrollingDown(for: scrollView)
    }
    
    override func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        fetchDataWhileScrollingDown(for: scrollView)
    }
    
    // MARK: Private methods
    private func setupView() {
        view.backgroundColor = .secondarySystemBackground
        title = viewModel.navigationTitle
    }
    
    private func registerTableView() {
        tableView.register(UINib(nibName: reuseIdentifier, bundle: nil), forCellReuseIdentifier: reuseIdentifier)
    }
    
    private func bind() {
        viewModel.updatedIndexPathBehaviorRelay
            .asDriver()
            .drive(onNext: { [weak self] indexPaths in
                guard let strongSelf = self,
                      let updatedIndexPaths = indexPaths
                else { return }
                if updatedIndexPaths.isEmpty {
                    strongSelf.tableView.reloadData()
                } else {
                    strongSelf.tableView.insertRows(
                        at: updatedIndexPaths,
                        with: .automatic
                    )
                }
            }).disposed(by: viewModel.disposeBag)
    }
    
    private func fetchDataWhileScrollingDown(for scrollView: UIScrollView) {
        let offsetY = scrollView.contentOffset.y
        let contentHeight = scrollView.contentSize.height
        
        if offsetY >= contentHeight - scrollView.frame.height {
            guard !Environment.isMock else { return }
            
            if viewModel.pageNotOffset && !viewModel.isLoading {
                viewModel.loadCharacterList()
                UIView.animate(withDuration: 1) {
                    self.tableView.contentOffset.y += 50
                }
            }
        }
    }
}
