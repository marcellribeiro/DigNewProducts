//
//  NSObjectExtension.swift
//  DigioNewProducts
//
//  Created by Marcell Ribeiro on 02/11/21.
//

import Foundation

extension NSObject {
    @objc var className: String {
        return String(describing: type(of: self))
    }

    @objc class var className: String {
        return String(describing: self)
    }
}
