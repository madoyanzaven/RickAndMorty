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
    private lazy var segmentedControl: UISegmentedControl = {
        let sc = UISegmentedControl(items: ["All", "Alive", "Dead", "unknown"])
        sc.selectedSegmentIndex = 0
        sc.tintColor = .systemBlue
        sc.backgroundColor = Constants.Colors.mainGray
        sc.addTarget(self, action: #selector(handleSegmentedControlSwitch(_:)), for: .valueChanged)
        return sc }()

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
        setupSegmentedControl()
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
        return 200
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
        title = viewModel.navigationTitle
    }

    private func setupSegmentedControl() {
        navigationItem.titleView = segmentedControl
    }

    @objc func handleSegmentedControlSwitch(_ segmentedControl: UISegmentedControl) {
        switch(segmentedControl.selectedSegmentIndex) {
        case 0:
            viewModel.hundleSegmentAction(with: nil)
        case 1:
            viewModel.hundleSegmentAction(with: .alive)
        case 2:
            viewModel.hundleSegmentAction(with: .daed)
        case 3:
            viewModel.hundleSegmentAction(with: .unknown)
        default:
            break
        }
    }
    
    private func registerTableView() {
        tableView.register(UINib(nibName: reuseIdentifier, bundle: nil), forCellReuseIdentifier: reuseIdentifier)
        tableView.separatorStyle = .none
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