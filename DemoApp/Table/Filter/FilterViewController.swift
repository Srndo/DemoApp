//
//  FilterViewController.swift
//  DemoApp
//
//  Created by Simon Sestak on 09/08/2021.
//

import UIKit

class FilterViewController: UIViewController {
    var viewModel: FilterViewModel

    init(viewModel: FilterViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }

    lazy var textField: UITextField = {
        let textField = UITextField(frame: viewModel.textFieldFrame)
        textField.borderStyle = .none
        textField.center = view.center
        textField.center.y = view.center.y - 100
        textField.placeholder = viewModel.textFieldPlaceholder
        textField.layer.addSublayer(bottomLine)
        return textField
    }()

    lazy var bottomLine: CALayer = {
        let bottomLine = CALayer()
        bottomLine.frame = viewModel.bottomLineFrame
        bottomLine.backgroundColor = viewModel.bottomLineColor
        return bottomLine
    }()

    lazy var button: MyButton = {
        let button = MyButton(title: viewModel.buttonTitle)
        button.setTitle(viewModel.buttonTitle, for: .normal)
        button.center(to: view.center)
        button.addTarget(self, action: #selector(buttonTap), for: .touchUpInside)
        return button
    }()

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        view.addSubview(textField)
        view.addSubview(button)
    }

    @objc func buttonTap() {
        viewModel.buttonTap(key: textField.text)
    }

}
