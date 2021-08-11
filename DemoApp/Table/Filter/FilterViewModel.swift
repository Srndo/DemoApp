//
//  FilterViewModel.swift
//  DemoApp
//
//  Created by Simon Sestak on 09/08/2021.
//

import UIKit

class FilterViewModel {
    var coordinator: FilterCoordinator!

    let backgroundColor: UIColor = .white
    let buttonTitle = "Search"

    init(coordinator: FilterCoordinator) {
        self.coordinator = coordinator
    }

    func buttonTap(key: String?) {
        coordinator.setFilter(with: key)
    }
}
