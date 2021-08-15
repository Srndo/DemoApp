//
//  InternetCheck.swift
//  DemoApp
//
//  Created by Simon Sestak on 15/08/2021.
//

import UIKit

protocol InternetCheck: UIViewController {
    var noInternetView: UIView! { get set }
    var noInternetLabel: UILabel! { get set }
}

extension InternetCheck {
    private func hideView() {
        noInternetView.alpha = 0
    }
    private func showView() {
        noInternetView.alpha = 0.7
    }

    private func setLabelText() {
        noInternetLabel.text = "Error: No internet connection!"
        noInternetLabel.textColor = .systemRed
    }

    func inicializeNoInternetView() {
        setLabelText()
        if !Connectivity.isConnectedToInternet {
           hideView()
        } else {
            showView()
        }
    }
}
