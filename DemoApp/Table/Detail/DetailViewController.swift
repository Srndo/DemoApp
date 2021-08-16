//
//  CellViewController.swift
//  DemoApp
//
//  Created by Simon Sestak on 05/08/2021.
//

import UIKit

class DetailViewController: UIViewController, Storyboarded, SpinnerView {
    var viewModel: DetailViewModel!

    @IBOutlet weak var noInternetView: UIView!
    @IBOutlet weak var noInternetLabel: UILabel!

    @IBOutlet weak var nameLabel: UILabel?
    @IBOutlet weak var addressLabel: UILabel?
    @IBOutlet weak var phoneLabel: UILabel?
    @IBOutlet weak var emailLabel: UILabel?

    var spinner = SpinnerViewController()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        title = viewModel.title
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

extension DetailViewController: InternetCheck {
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        inicializeNoInternetView()
    }
}
