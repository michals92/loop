//
//  DeviceCollectionViewDataSource.swift
//  loop
//
//  Created by Michal Šimík on 13.05.2022.
//

import UIKit

final class DeviceCollectionViewDataSource: NSObject, UICollectionViewDataSource {
    var cellModels: [DeviceCollectionViewCellModel] = []

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        cellModels.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: String(describing: DeviceCollectionViewCell.self), for: indexPath) as? DeviceCollectionViewCell else {
            fatalError("unable to dequeue reusable cell with identifier \(String(describing: DeviceCollectionViewCell.self))")
        }

        cell.configure(cellModel: cellModels[indexPath.item])
        return cell
    }
}
