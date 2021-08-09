//
//  SpinnerViewController.swift
//  DemoApp
//
//  Created by Simon Sestak on 09/08/2021.
//

import UIKit

class SpinnerViewController: UIViewController {
    var spinner = UIActivityIndicatorView(style: .large)

    override func loadView() {
        view = UIView()
        view.backgroundColor = UIColor(white: 0, alpha: 0.15)

        spinner.translatesAutoresizingMaskIntoConstraints = false
        spinner.startAnimating()
        view.addSubview(spinner)

        spinner.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        spinner.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
    }

    func createSpinnerView(parent: UIViewController) {
        parent.addChild(self)
        self.view.frame = parent.view.frame
        parent.view.addSubview(self.view)
        self.didMove(toParent: parent)
    }

    func removeSpinnerView(parent: UIViewController) {
        self.willMove(toParent: parent)
        self.view.removeFromSuperview()
        self.removeFromParent()
    }
}
