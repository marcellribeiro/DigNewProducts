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
        self.titleLabel?.text = selectedTitle
        self.descriptionLabel?.text = selectedDescription

        self.view.accessibilityIdentifier = "descriptionViewController"
        self.titleLabel.accessibilityIdentifier = "titleLabel"
        self.descriptionLabel.accessibilityIdentifier = "descriptionLabel"

        updateView()
    }

    func updateView() {
        print("updateView")
        print("title \(self.selectedTitle)")
        print("description \(self.selectedDescription)")

        self.titleLabel.text = self.selectedTitle
        self.descriptionLabel.text = self.selectedDescription
    }

}
