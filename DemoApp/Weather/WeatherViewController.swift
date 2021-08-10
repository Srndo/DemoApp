//
//  WeatherViewController.swift
//  DemoApp
//
//  Created by Simon Sestak on 04/08/2021.
//

import UIKit

class WeatherViewController: UIViewController, Storyboarded {

    var viewModel: WeatherViewModel!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var firstLabel: UILabel!
    @IBOutlet weak var secondLabel: UILabel!
    @IBOutlet weak var iconImage: UIImageView!
    @IBOutlet weak var thirdLabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        setBackgroundImage()
        viewModel.updateWithCurrentLocation {
            self.fillData()
            self.setIcon()
        }
    }

    private func setBackgroundImage() {
        imageView.image = viewModel.backgroundImage
    }

    private func fillData() {
        firstLabel.text = viewModel.labelText[.first]
        secondLabel.text = viewModel.labelText[.second]
        thirdLabel.text = viewModel.labelText[.third]
        thirdLabel.textColor = viewModel.thirdLabelColor
    }

    private func setIcon() {
        iconImage.image = viewModel.iconImage
    }
}
