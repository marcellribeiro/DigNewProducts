//
//  ProductsResponseModel.swift
//  DigioNewProducts
//
//  Created by Marcell Ribeiro on 02/11/21.
//

import Foundation

struct ProductsResponseModel: Codable {
    var cash: CashModel
    var spotlight: [SpotlightModel]
    var products: [ProductModel]
}

struct SpotlightModel: Codable {
    var name: String
    var bannerUrl: String
    var description: String

    enum CodingKeys: String, CodingKey {
        case name
        case bannerUrl = "bannerURL"
        case description
    }
}

struct ProductModel: Codable {
    var name: String
    var imageUrl: String
    var description: String

    enum CodingKeys: String, CodingKey {
        case name
        case imageUrl = "imageURL"
        case description
    }
}

struct CashModel: Codable {
    var title: String
    var bannerUrl: String
    var description: String

    enum CodingKeys: String, CodingKey {
        case title
        case bannerUrl = "bannerURL"
        case description
    }
}
