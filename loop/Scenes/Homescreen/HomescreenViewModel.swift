//
//  HomescreenViewModel.swift
//  loop
//
//  Created by Michal Šimík on 13.05.2022.
//

import Foundation

protocol HomescreenViewControllerInput: AnyObject {
    func reloadData(cellModels: [DeviceCollectionViewCellModel])
}

protocol HomescreenCoordinatorInput: AnyObject {
    func stop()
    func showAlert(title: String, message: String, repeatHandler: Action?)
}

protocol HomescreenViewModelInput: AnyObject {
    func viewDidLoad()
}

final class HomescreenViewModel: HomescreenViewModelInput {
    @Injected(\.deviceService) var deviceService: DeviceService

    private let coordinator: HomescreenCoordinatorInput
    private weak var viewController: HomescreenViewControllerInput?

    init(coordinator: HomescreenCoordinatorInput, viewController: HomescreenViewControllerInput) {
        self.coordinator = coordinator
        self.viewController = viewController
    }

    func viewDidLoad() {
        let cellModels = deviceService.getDevices().map { DeviceCollectionViewCellModel(device: $0) }
        viewController?.reloadData(cellModels: cellModels)
    }
}
