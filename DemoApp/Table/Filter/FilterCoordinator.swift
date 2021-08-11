//
//  FilterCoordinator.swift
//  DemoApp
//
//  Created by Simon Sestak on 09/08/2021.
//

import UIKit

class FilterCoordinator: Coordinator {
    var window: UIWindow?
    var viewController: FilterViewController?
    var childCoordinators: [Coordinator] = []
    var parentCoordinator: Coordinator?

    init(window: UIWindow?) {
        self.window = window
    }

    func start() {
        let viewModel = FilterViewModel(coordinator: self)
        viewController = FilterViewController(viewModel: viewModel)
        if let viewController = viewController {
            window.rootUINavigationController()?.present(viewController, animated: true)
        }
    }

    func setFilter(with key: String?) {
        viewController?.dismiss(animated: true) {
            guard let tableCoordinator = self.parentCoordinator as? HaveFilterCoordinator else { return }
            tableCoordinator.filterDidFinish(with: key)
        }
    }
}
