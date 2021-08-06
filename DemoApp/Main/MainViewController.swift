//
//  MainViewController.swift
//  DemoApp
//
//  Created by Simon Sestak on 04/08/2021.
//

import UIKit

class MainViewController: UIViewController {

    var viewModel: MainViewModel!

    init(viewModel: MainViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    lazy var button: MyButton = {
        let button = MyButton(title: viewModel.titleButton1)
        button.center(to: view.center, 0, -30)
        button.addTarget(self, action: #selector(button1Tap), for: .touchUpInside)
        return button
    }()

    lazy var button2: MyButton = {
        let button = MyButton(title: viewModel.titleButton2)
        button.center(to: view.center, 0, 30)
        button.addTarget(self, action: #selector(button2Tap), for: .touchUpInside)
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        title = viewModel.viewTitle
        view.addSubview(button)
        view.addSubview(button2)
    }

    @objc func button1Tap() {
        viewModel.button1Tapped()
    }

    @objc func button2Tap() {
        viewModel.button2Tapped()
    }

}
