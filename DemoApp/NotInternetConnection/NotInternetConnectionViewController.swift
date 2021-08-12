//
//  NotInternetConnectionViewController.swift
//  DemoApp
//
//  Created by Simon Sestak on 12/08/2021.
//

import UIKit

class NotInternetConnectionViewController: UIViewController, Storyboarded {

    var viewModel: NotInternetConnectionViewModel!

    @IBOutlet weak var label: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        configureLabel()
    }

    private func configureLabel() {
        label.text = viewModel.labelText
        label.textColor = viewModel.labelTextColor
    }
}
