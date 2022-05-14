//
//  ItemInfoCollectionViewCell.swift
//  loop
//
//  Created by Michal Šimík on 13.05.2022.
//

import UIKit

class DeviceCollectionViewCell: UICollectionViewCell {
    private var collectionView: UICollectionView!
    private var deviceCellModel: DeviceCollectionViewCellModel?

    override init(frame: CGRect) {
        super.init(frame: frame)
        setLayout()

        collectionView.register(UINib(nibName: String(describing: InfoDataCollectionViewCell.self), bundle: nil), forCellWithReuseIdentifier: String(describing: InfoDataCollectionViewCell.self))
        collectionView.register(UINib(nibName: String(describing: TemperatureCollectionViewCell.self), bundle: nil), forCellWithReuseIdentifier: String(describing: TemperatureCollectionViewCell.self))
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func prepareForReuse() {
        super.prepareForReuse()
    }

    func configure(cellModel: DeviceCollectionViewCellModel) {
        self.deviceCellModel = cellModel

        collectionView.dataSource = cellModel
        collectionView.reloadData()
    }

    private func collectionViewLayout() -> UICollectionViewLayout {
        let config = UICollectionViewCompositionalLayoutConfiguration()
        config.scrollDirection = .vertical

        let itemSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(0.5),
            heightDimension: .fractionalHeight(0.5)
        )
        let item = NSCollectionLayoutItem(layoutSize: itemSize)

        let group = NSCollectionLayoutGroup.horizontal(layoutSize: itemSize, subitem: item, count: 2)
        let section = NSCollectionLayoutSection(group: group)

        return UICollectionViewCompositionalLayout(section: section, configuration: config)
    }

    private func setLayout() {
        collectionView = UICollectionView(frame: .zero, collectionViewLayout: collectionViewLayout())

        collectionView.translatesAutoresizingMaskIntoConstraints = false
        addSubview(collectionView)

        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: topAnchor),
            collectionView.bottomAnchor.constraint(equalTo: bottomAnchor),
            collectionView.leadingAnchor.constraint(equalTo: leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: trailingAnchor)
        ])
    }
}
