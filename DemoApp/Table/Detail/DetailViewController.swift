//
//  CellViewController.swift
//  DemoApp
//
//  Created by Simon Sestak on 05/08/2021.
//

import UIKit

class DetailViewController: BaseViewController<DetailViewModel>, Storyboarded, SpinnerView {

    @IBOutlet weak var nameLabel: UILabel?
    @IBOutlet weak var addressLabel: UILabel?
    @IBOutlet weak var phoneLabel: UILabel?
    @IBOutlet weak var emailLabel: UILabel?

    var spinner = SpinnerViewController()

    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.user.bind { _ in
            self.fillLabels()
            self.spinnerStop(viewController: self)
        }
        spinnerStart(viewController: self)
    }

    private func fillLabels() {
        nameLabel?.text = viewModel.user.value.name
        addressLabel?.text = "\(viewModel.user.value.address.city), \(viewModel.user.value.address.street)"
        phoneLabel?.text = viewModel.user.value.phone
        emailLabel?.text = viewModel.user.value.email
    }
}
