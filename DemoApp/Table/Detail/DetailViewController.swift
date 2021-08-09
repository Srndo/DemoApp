//
//  CellViewController.swift
//  DemoApp
//
//  Created by Simon Sestak on 05/08/2021.
//

import UIKit

class DetailViewController: UIViewController, Storyboarded {
    var viewModel: DetailViewModel!

    @IBOutlet weak var nameLabel: UILabel?
    @IBOutlet weak var addressLabel: UILabel?
    @IBOutlet weak var phoneLabel: UILabel?
    @IBOutlet weak var emailLabel: UILabel?
    private let spinner = SpinnerViewController()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        title = viewModel.title
        fillLabels(viewModel.user)
        spinner.createSpinnerView(parent: self)
    }

    func stopSpinner() {
        self.spinner.removeSpinnerView(parent: self)
    }

    func fillLabels(_ user: DetailUserModel) {
        nameLabel?.text = user.name
        addressLabel?.text = "\(user.address.city), \(user.address.street)"
        phoneLabel?.text = user.phone
        emailLabel?.text = user.email
    }
}
