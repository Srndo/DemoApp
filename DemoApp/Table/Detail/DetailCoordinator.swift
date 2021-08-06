//
//  CellCoordinator.swift
//  DemoApp
//
//  Created by Simon Sestak on 05/08/2021.
//

import UIKit

class DetailCoordinator: Coordinator {
    var window: UIWindow?
    var viewController: DetailViewController!
    var childCoordinators: [Coordinator] = []
    var parentCoordinator: Coordinator?
    var userID: Int = -1

    init(window: UIWindow?) {
        self.window = window
    }

    func start() {
        let vm = DetailViewModel(coordinator: self, userID: userID) // swiftlint:disable:this identifier_name
        let vc = DetailViewController(vm)                           // swiftlint:disable:this identifier_name
        vc.coordinator = self
        (window?.rootViewController as? UINavigationController)?.pushViewController(vc, animated: true)
    }
}
