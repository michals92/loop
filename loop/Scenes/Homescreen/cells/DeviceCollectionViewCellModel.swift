//
//  DeviceCollectionViewCellModel.swift
//  loop
//
//  Created by Michal Šimík on 13.05.2022.
//

import Foundation
import UIKit

final class DeviceCollectionViewCellModel: NSObject {
    let device: Device
    var infoDataCellModels: [InfoDataCollectionViewCellModel] = []
    var temperatureCellModels: [TemperatureCollectionViewCellModel] = []

    init(device: Device) {
        self.device = device

        infoDataCellModels = device.infoData.map { InfoDataCollectionViewCellModel(infoData: $0) }
        temperatureCellModels = device.currentTemperatures.map { TemperatureCollectionViewCellModel(currentTemperature: $0) }
    }
}

extension DeviceCollectionViewCellModel: UICollectionViewDataSource {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        2
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if section == 0 {
            return infoDataCellModels.count
        } else {
            return device.currentTemperatures.count
        }
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if indexPath.section == 0 {
            // info cell
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: String(describing: InfoDataCollectionViewCell.self), for: indexPath) as? InfoDataCollectionViewCell else {
                fatalError("unable to dequeue reusable cell with identifier \(String(describing: InfoDataCollectionViewCell.self))")
            }

            cell.configure(cellModel: infoDataCellModels[indexPath.item])
            return cell

        } else {
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: String(describing: TemperatureCollectionViewCell.self), for: indexPath) as? TemperatureCollectionViewCell else {
                fatalError("unable to dequeue reusable cell with identifier \(String(describing: TemperatureCollectionViewCell.self))")
            }

            cell.configure(cellModel: temperatureCellModels[indexPath.item])
            return cell
        }
    }
}
