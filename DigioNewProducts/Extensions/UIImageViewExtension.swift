//
//  UIImageViewExtension.swift
//  DigioNewProducts
//
//  Created by Marcell Ribeiro on 02/11/21.
//

import Foundation
import UIKit
import Kingfisher

extension UIImageView {
    func rounded() {
        layer.cornerRadius = 8.0
    }

    func setNetworkImage(imageUrl: String) {
        guard let url = URL(string: imageUrl) else {
            return
        }

        self.kf.indicatorType = .activity
        self.kf.setImage(
            with:url,
            options: [
                .transition(.fade(1)),
            ]
        )
    }
}
