//
//  WeatherViewController.swift
//  DemoApp
//
//  Created by Simon Sestak on 04/08/2021.
//

import UIKit

class WeatherViewController: BaseViewController<WeatherViewModel>, Storyboarded {
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var firstLabel: UILabel!
    @IBOutlet weak var secondLabel: UILabel!
    @IBOutlet weak var iconImage: UIImageView!
    @IBOutlet weak var thirdLabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        setBackgroundImage()
        bindViewModel()
    }

    private func bindViewModel() {
        viewModel.labelText.bind { _ in
            self.fillLabels()
        }

        viewModel.iconImage.bind { _ in
            self.iconImage.image = self.viewModel.iconImage.value
        }

        viewModel.thirdLabelColor.bind { _ in
            self.thirdLabel.textColor = self.viewModel.thirdLabelColor.value
        }
    }

    private func setBackgroundImage() {
        imageView.image = viewModel.backgroundImage
    }

    private func fillLabels() {
        firstLabel.text = viewModel.labelText.value[.first]
        secondLabel.text = viewModel.labelText.value[.second]
        thirdLabel.text = viewModel.labelText.value[.third]
    }
}
