//
//  Coordinator.swift
//  loop
//
//  Created by Michal Šimík on 13.05.2022.
//

import Foundation

protocol Coordinator {
    func start()
    func stop()
}

extension Coordinator {
    func stop() {}
}
