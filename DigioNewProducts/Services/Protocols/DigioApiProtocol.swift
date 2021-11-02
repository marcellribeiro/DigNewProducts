//
//  DigioApiProtocol.swift
//  DigioNewProducts
//
//  Created by Marcell Ribeiro on 02/11/21.
//

import Foundation

protocol DigioApiProtocol {
    func getProducts(completionHandler: @escaping(ProductsResponseModel?) -> Void)
}
