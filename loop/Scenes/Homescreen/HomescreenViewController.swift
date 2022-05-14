//
//  HomescreenViewController.swift
//  loop
//
//  Created by Michal Šimík on 13.05.2022.
//

import UIKit

class HomescreenViewController: UIViewController {
    private var collectionView: UICollectionView!

    var viewModel: HomescreenViewModelInput?
    private let dataSource = DeviceCollectionViewDataSource()

    override func loadView() {
        super.loadView()
        setLayout()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel?.viewDidLoad()

        collectionView.register(DeviceCollectionViewCell.self, forCellWithReuseIdentifier: String(describing: DeviceCollectionViewCell.self))
        collectionView.setCollectionViewLayout(collectionViewLayout(), animated: true)
        collectionView.dataSource = dataSource
    }

    private func setLayout() {
        view.backgroundColor = .systemBackground

        collectionView = UICollectionView(frame: view.frame, collectionViewLayout: collectionViewLayout())

        collectionView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(collectionView)

        NSLayoutConstraint.activate([
            collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            collectionView.topAnchor.constraint(equalTo: view.topAnchor),
            collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
    }

    private func collectionViewLayout() -> UICollectionViewLayout {
        let config = UICollectionViewCompositionalLayoutConfiguration()
        config.scrollDirection = .horizontal

        let itemSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1),
            heightDimension: .fractionalHeight(1)
        )
        let item = NSCollectionLayoutItem(layoutSize: itemSize)

        let group = NSCollectionLayoutGroup.horizontal(layoutSize: itemSize, subitem: item, count: 1)
        let section = NSCollectionLayoutSection(group: group)

        return UICollectionViewCompositionalLayout(section: section, configuration: config)
    }
}

extension HomescreenViewController: HomescreenViewControllerInput {
    func reloadData(cellModels: [DeviceCollectionViewCellModel]) {
        dataSource.cellModels = cellModels
        collectionView.reloadData()
    }
}
