//
//  FilterViewModel.swift
//  DemoApp
//
//  Created by Simon Sestak on 09/08/2021.
//

import UIKit

class FilterViewModel: BaseViewModel {
    var coordinator: FilterCoordinator!

    override var title: String { "Search" }

    init(coordinator: FilterCoordinator) {
        self.coordinator = coordinator
        super.init()
    }

    func buttonTap(key: String?) {
        coordinator.setFilter(with: key)
    }
}
