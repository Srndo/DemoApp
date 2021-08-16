//
//  WeatherViewController.swift
//  DemoApp
//
//  Created by Simon Sestak on 04/08/2021.
//

import UIKit

class WeatherViewController: UIViewController, Storyboarded, InternetCheck {
    var viewModel: WeatherViewModel!

    @IBOutlet weak var noInternetView: UIView!
    @IBOutlet weak var noInternetLabel: UILabel!

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var firstLabel: UILabel!
    @IBOutlet weak var secondLabel: UILabel!
    @IBOutlet weak var iconImage: UIImageView!
    @IBOutlet weak var thirdLabel: UILabel!

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        inicializeNoInternetView()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        setBackgroundImage()
        title = viewModel.title
        viewModel.labelText.bind { _ in
            self.fillLabels()
        }

        viewModel.iconImage.bind { _ in
            self.setIcon()
        }

        viewModel.thirdLabelColor.bind { _ in
            self.setThirdLabelColor()
        }
    }

    private func setBackgroundImage() {
        imageView.image = viewModel.backgroundImage
    }

    private func setThirdLabelColor() {
        thirdLabel.textColor = viewModel.thirdLabelColor.value
    }
    private func fillLabels() {
        firstLabel.text = viewModel.labelText.value[.first]
        secondLabel.text = viewModel.labelText.value[.second]
        thirdLabel.text = viewModel.labelText.value[.third]
    }

    private func setIcon() {
        iconImage.image = viewModel.iconImage.value
    }
}
