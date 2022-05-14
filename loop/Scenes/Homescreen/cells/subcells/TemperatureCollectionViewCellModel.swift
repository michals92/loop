//
//  TemperatureCollectionViewCellModel.swift
//  loop
//
//  Created by Michal Šimík on 14.05.2022.
//

import Foundation

final class TemperatureCollectionViewCellModel {
    let currentTemperature: CurrentTemperature

    init(currentTemperature: CurrentTemperature) {
        self.currentTemperature = currentTemperature
    }
}
