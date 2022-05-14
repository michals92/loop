//
//  DeviceService.swift
//  loop
//
//  Created by Michal Šimík on 14.05.2022.
//

import Foundation

protocol DeviceService {
    func getDevices() -> [Device]
}
