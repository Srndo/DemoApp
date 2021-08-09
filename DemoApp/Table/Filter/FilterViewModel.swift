//
//  FilterViewModel.swift
//  DemoApp
//
//  Created by Simon Sestak on 09/08/2021.
//

import UIKit

class FilterViewModel {
    var coordinator: FilterCoordinator!

    init(coordinator: FilterCoordinator) {
        self.coordinator = coordinator
    }

    let bottomLineColor = CGColor.init(red: 92/255, green: 194/255, blue: 242/255, alpha: 1)
    let textFieldFrame = CGRect(x: 0, y: 0, width: 350, height: 60)
    var bottomLineFrame: CGRect {
        return CGRect(x: 0, y: textFieldFrame.height - 2, width: textFieldFrame.width, height: 2)
    }
    let textFieldPlaceholder = "Filter key"
    let buttonTitle = "Search"

    func buttonTap(key: String?) {
        coordinator.viewController?.dismiss(animated: true) {
            guard let tableCoordinator = self.coordinator.parentCoordinator as? TableCoordinator else { return }
            tableCoordinator.filterDidFinish(key: key)
        }
    }
}
