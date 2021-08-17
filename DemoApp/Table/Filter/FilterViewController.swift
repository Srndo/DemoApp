//
//  FilterViewController.swift
//  DemoApp
//
//  Created by Simon Sestak on 09/08/2021.
//

import UIKit

class FilterViewController: BaseViewController<FilterViewModel>, Storyboarded {
    @IBOutlet weak var button: UIButton!
    @IBOutlet weak var textField: UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func buttonTap(_ sender: Any) {
        viewModel.buttonTap(key: textField.text)
    }
}
