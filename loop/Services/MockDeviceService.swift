//
//  MockDeviceService.swift
//  loop
//
//  Created by Michal Šimík on 14.05.2022.
//

import Foundation

class MockDeviceService: DeviceService {
    func getDevices() -> [Device] {
        return [
            Device(name: "LogWIN",
                   city: "Zlin",
                   temperature: 7,
                   infoData: [
                    InfoData(type: "floor", name: "1st Floor", temperature: 22),
                    InfoData(type: "floor", name: "2nd Floor", temperature: 22),
                    InfoData(type: "device", name: "PuroWIN 1", temperature: 65),
                    InfoData(type: "device", name: "PuroWIN 2", temperature: 42),
                    InfoData(type: "device", name: "Kaskade", temperature: 65)
                   ],
                   currentTemperatures: [
                    CurrentTemperature(name: "Room temperature 1st Floor", temperature: 22),
                    CurrentTemperature(name: "Room temperature 2nd Floor", temperature: 22),
                    CurrentTemperature(name: "Domestic hot water 1st Floor", temperature: 65)
                   ],
                   latestUpdate: Date()),
            Device(name: "Demo BioWIN",
                   city: "Demo City",
                   temperature: 7,
                   infoData: [
                    InfoData(type: "floor", name: "1st Floor", temperature: 22),
                    InfoData(type: "device", name: "BioWIN2", temperature: 29.7),
                    InfoData(type: "device", name: "AeroWIN", temperature: 35.4),
                    InfoData(type: "device", name: "B-PLM", temperature: 76)
                   ],
                   currentTemperatures: [
                    CurrentTemperature(name: "Room temperature 1st Floor", temperature: 22),
                    CurrentTemperature(name: "Domestic hot water 1st Floor", temperature: 65)
                   ],
                   latestUpdate: Date()),
            Device(name: "Demo PiroWIN 1",
                   city: "New York",
                   temperature: 7,
                   infoData: [
                    InfoData(type: "device", name: "PuroWIN 1", temperature: 65),
                    InfoData(type: "device", name: "PuroWIN 2", temperature: 42),
                    InfoData(type: "device", name: "Kaskade", temperature: 65)
                   ],
                   currentTemperatures: [
                    CurrentTemperature(name: "Room temperature 1st Floor", temperature: 22),
                    CurrentTemperature(name: "Room temperature 2nd Floor", temperature: 22),
                    CurrentTemperature(name: "Domestic hot water 1st Floor", temperature: 65)
                   ],
                   latestUpdate: Date())
        ]
    }
}
