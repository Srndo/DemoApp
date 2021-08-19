//
//  MainViewController.swift
//  DemoApp
//
//  Created by Simon Sestak on 04/08/2021.
//

import UIKit

class MainViewController: BaseViewController<MainViewModel>, Storyboarded {

    @IBOutlet weak var button1: UIButton?
    @IBOutlet weak var button2: UIButton?
    @IBOutlet weak var tabBar: UITabBar!

    override func viewDidLoad() {
        super.viewDidLoad()
        tabBar.delegate = self
        setTabBarItems()
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

extension MainViewController: UITabBarDelegate {
    private func setTabBarItems() {
        tabBar.items = viewModel.tabBarItems
    }

    func tabBar(_ tabBar: UITabBar, didSelect item: UITabBarItem) {
        switch item.tag {
        case 0:
            viewModel.button2Tapped()
        case 1:
            viewModel.button1Tapped()
        default:
            print(item.tag)
        }
    }
}
