//
//  CoordinatorWithInternetCheck.swift
//  DemoApp
//
//  Created by Simon Sestak on 12/08/2021.
//

import Foundation

protocol CoordinatorWithInternetCheck: Coordinator {
    func startInternetON()
    func startInternetOFF()
}

extension CoordinatorWithInternetCheck {
    func start() {
        if Connectivity.isConnectedToInternet {
            startInternetON()
        } else {
            startInternetOFF()
        }
    }

    func startInternetOFF() {
        let coordinator = NotInternetConnectionCoordinator(window: window)
        childCoordinators.append(coordinator)
        coordinator.parentCoordinator = self
        coordinator.start()
    }
}
