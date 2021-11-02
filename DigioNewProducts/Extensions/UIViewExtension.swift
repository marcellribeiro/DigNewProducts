//
//  UIViewExtension.swift
//  DigioNewProducts
//
//  Created by Marcell Ribeiro on 02/11/21.
//

import Foundation
import UIKit

extension UIView {
    func roundedWithShadow() {
        layer.cornerRadius = 8.0
        layer.masksToBounds = false
        layer.shadowColor = UIColor.black.cgColor
        layer.shadowOpacity = 0.2
        layer.shadowOffset = CGSize(width: 0, height: 3)
    }
}
