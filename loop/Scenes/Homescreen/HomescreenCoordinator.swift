//
//  HomescreenCoordinator.swift
//  loop
//
//  Created by Michal Šimík on 13.05.2022.
//

import UIKit

typealias Action = () -> Void

final class HomescreenCoordinator: Coordinator {
    private var navigationController: UINavigationController?
    private weak var viewController: HomescreenViewController?

    private let window: UIWindow

    init(window: UIWindow) {
        self.window = window
    }

    func start() {
        let viewController = HomescreenViewController()
        let viewModel = HomescreenViewModel(coordinator: self, viewController: viewController)
        viewController.viewModel = viewModel
        self.viewController = viewController
        self.navigationController = UINavigationController(rootViewController: viewController)
        window.rootViewController = navigationController
    }
}

extension HomescreenCoordinator: HomescreenCoordinatorInput {
    func showAlert(title: String, message: String, repeatHandler: Action?) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)

        if let repeatHandler = repeatHandler {
            let repeatAction = UIAlertAction(title: "Repeat", style: .default) { _ in
                repeatHandler()
            }
            alert.addAction(repeatAction)
        }
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel)
        alert.addAction(cancelAction)
        viewController?.present(alert, animated: true)
    }
}
