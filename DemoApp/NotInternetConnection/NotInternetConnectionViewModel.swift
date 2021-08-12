//
//  NotInternetConnectionViewModel.swift
//  DemoApp
//
//  Created by Simon Sestak on 12/08/2021.
//

import UIKit

class NotInternetConnectionViewModel {
    let coordinator: NotInternetConnectionCoordinator

    init(coordinator: NotInternetConnectionCoordinator) {
        self.coordinator = coordinator
    }

    let labelText = "Not internet connection"
    let labelTextColor: UIColor = .red
}
