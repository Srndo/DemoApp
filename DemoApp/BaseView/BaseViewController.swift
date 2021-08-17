//
//  BaseViewController.swift
//  DemoApp
//
//  Created by Simon Sestak on 17/08/2021.
//

import UIKit

class BaseViewController<T: BaseViewModel>: UIViewController {
    var viewModel: T!

    override func viewDidLoad() {
        super.viewDidLoad()
        title = viewModel.title
        view.backgroundColor = viewModel.backgroundColor
        setupNavigationButton()
        setupViewForNoInternetConnection()
    }

    private func setupNavigationButton() {
        if let navButtonType = viewModel.navButtonType {
            // swiftlint:disable:next line_length
            navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: navButtonType, target: self, action: #selector(navButtonTap))
        }
    }

    @objc private func navButtonTap() {
        viewModel.navButtonTapped()
    }
}

extension BaseViewController {
    private func setupViewForNoInternetConnection() {
        viewModel.errorView.frame = self.view.frame
        viewModel.internetON.bind { value in
            if value {
                self.showNoInternetConnection()
            } else {
                self.hideNoInternetConnection()
            }
        }
    }

    private func hideNoInternetConnection() {
        viewModel.errorView.removeFromSuperview()
    }

    private func showNoInternetConnection() {
        self.view.addSubview(viewModel.errorView)
    }
}
