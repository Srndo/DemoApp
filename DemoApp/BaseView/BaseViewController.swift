//
//  BaseViewController.swift
//  DemoApp
//
//  Created by Simon Sestak on 17/08/2021.
//

import UIKit

class BaseViewController<T: BaseViewModel>: UIViewController {
    var viewModel: T!
    lazy var errorView: UIView = {
        return createErrorView()
    }()

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
        viewModel.internetON.bind { value in
            if value {
                self.showNoInternetConnection()
            } else {
                self.hideNoInternetConnection()
            }
        }
    }

    private func hideNoInternetConnection() {
        errorView.removeFromSuperview()
    }

    private func showNoInternetConnection() {
        self.view.addSubview(errorView)
    }

    private func createErrorView() -> UIView {
        let view = UIView()
        let label = setupErrorLabel()
        view.frame = self.view.frame
        view.backgroundColor = .white
        view.alpha = 0.95
        label.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(label)

        label.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        label.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        return view
    }

    private func setupErrorLabel() -> UILabel {
        let label = UILabel()
        label.text = "ERROR: No internet connection."
        label.textColor = .systemRed
        return label
    }
}
