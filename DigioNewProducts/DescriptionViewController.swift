//
//  DescriptionViewController.swift
//  DigioNewProducts
//
//  Created by Marcell Ribeiro on 02/11/21.
//

import UIKit


class DescriptionViewController: UIViewController {
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    var selectedTitle:String = ""
    var selectedDescription:String = ""

    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.accessibilityIdentifier = "descriptionViewController"
        self.titleLabel.accessibilityIdentifier = "titleLabel"
        self.descriptionLabel.accessibilityIdentifier = "descriptionLabel"

        self.titleLabel.text = self.selectedTitle
        self.descriptionLabel.text = self.selectedDescription
    }

}
