//
//  AppCoordinator.swift
//  loop
//
//  Created by Michal Šimík on 13.05.2022.
//

import UIKit

final class AppCoordinator: Coordinator {
    private let window: UIWindow

    init() {
        window = UIWindow()
        window.makeKeyAndVisible()
    }

    func start() {
        let homescreenCoordinator = HomescreenCoordinator(window: window)
        homescreenCoordinator.start()
    }
}
