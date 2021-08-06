//
//  CellViewController.swift
//  DemoApp
//
//  Created by Simon Sestak on 05/08/2021.
//

import UIKit

class DetailViewController: UIViewController {
    let viewModel: DetailViewModel!
    let nameLabel = MyLabel()
    let emailLabel = MyLabel()
    let phoneLabel = MyLabel()
    let addressLabel = MyLabel()

    init(_ viewModel: DetailViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
        viewModel.userDidChange = { [weak self] (user: DetailUserModel) in
            DispatchQueue.main.async {
                self?.fillLabels(user)
            }
        }
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        title = viewModel.title
        createLabels()
    }

    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        viewModel.didFinish()
    }

    private func createLabels() {
        view.addSubview(nameLabel)
        view.addSubview(emailLabel)
        view.addSubview(phoneLabel)
        view.addSubview(addressLabel)
    }

    private func fillLabels(_ user: DetailUserModel) {
        nameLabel.fill(user.name)
        nameLabel.center(to: view.center, 0, -80)
        addressLabel.fill(user.address)
        addressLabel.center(to: view.center, 0, -40)
        phoneLabel.fill(user.phone)
        phoneLabel.center(to: view.center)
        emailLabel.fill(user.email)
        emailLabel.center(to: view.center, 0, 40)
    }
}
