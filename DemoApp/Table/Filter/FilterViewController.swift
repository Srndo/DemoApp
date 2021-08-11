//
//  FilterViewController.swift
//  DemoApp
//
//  Created by Simon Sestak on 09/08/2021.
//

import UIKit

class FilterViewController: UIViewController, Storyboarded {
    var viewModel: FilterViewModel!

    @IBOutlet weak var button: UIButton!
    @IBOutlet weak var textField: UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = viewModel.backgroundColor
    }

    @IBAction func buttonTap(_ sender: Any) {
        viewModel.buttonTap(key: textField.text)
    }
}
