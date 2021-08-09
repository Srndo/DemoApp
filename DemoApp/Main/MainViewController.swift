//
//  MainViewController.swift
//  DemoApp
//
//  Created by Simon Sestak on 04/08/2021.
//

import UIKit

class MainViewController: UIViewController, Storyboarded {

    var viewModel: MainViewModel!

    @IBOutlet weak var button1: UIButton?
    @IBOutlet weak var button2: UIButton?

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        title = viewModel.viewTitle
        button1?.setTitle(viewModel.titleButton1, for: .normal)
        button2?.setTitle(viewModel.titleButton2, for: .normal)
    }

    @IBAction func button1Tap(_ sender: Any) {
        viewModel.button1Tapped()
    }

    @IBAction func button2Tap(_ sender: Any) {
        viewModel.button2Tapped()
    }
}
