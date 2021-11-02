//
//  ApiResponseModel.swift
//  DigioNewProducts
//
//  Created by Marcell Ribeiro on 02/11/21.
//

import Foundation

struct ApiResponseModel {
    var statusCode: Int
    var data: Data?
    var error: Bool
}
