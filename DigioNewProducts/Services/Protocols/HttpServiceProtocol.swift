//
//  HttpServiceProtocol.swift
//  DigioNewProducts
//
//  Created by Marcell Ribeiro on 02/11/21.
//

import Foundation

protocol HttpServiceProtocol {
    func get(urlString: String, completionHandler: @escaping(ApiResponseModel) -> Void)
}
