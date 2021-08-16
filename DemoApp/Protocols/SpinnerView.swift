//
//  SpinnerView.swift
//  DemoApp
//
//  Created by Simon Sestak on 16/08/2021.
//

import UIKit

protocol SpinnerView: UIViewController {
    var spinner: SpinnerViewController { get }
}

extension SpinnerView {
    func spinnerStart(viewController: UIViewController) {
        spinner.createSpinnerView(parent: viewController)
    }

    func spinnerStop(viewController: UIViewController) {
        guard spinner.parent != nil else { return }
        self.spinner.removeSpinnerView(parent: viewController)
    }
}
