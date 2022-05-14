//
//  Device.swift
//  loop
//
//  Created by Michal Šimík on 13.05.2022.
//

import Foundation

struct Device {
    let name: String
    let city: String
    let temperature: Double
    let infoData: [InfoData]
    let currentTemperatures: [CurrentTemperature]
    let latestUpdate: Date
}
