//
//  BaseViewModel.swift
//  DemoApp
//
//  Created by Simon Sestak on 17/08/2021.
//

import UIKit

class BaseViewModel {
    var navButtonType: UIBarButtonItem.SystemItem? { nil }
    var lastTask: (() -> Void)?
    var title: String { "Default title" }
    var backgroundColor: UIColor { .Background.blueLight }
    lazy var errorView: UIView = {
        return createErrorView()
    }()

    let internetON: Observable<Bool> = {
        return Observable(Connectivity.isConnectedToInternet)
    }()

    func navButtonTapped() {
        print("NavButtonTapped")
    }

    private func createErrorView() -> UIView {
        let view = UIView()
        let label = setupErrorLabel()
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
