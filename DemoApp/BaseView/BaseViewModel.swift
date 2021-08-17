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
    var backgroundColor: UIColor { .white }

    let internetON: Observable<Bool> = {
        return Observable(Connectivity.isConnectedToInternet)
    }()

    func navButtonTapped() {
        print("NavButtonTapped")
    }
}
