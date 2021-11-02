//
//  DigioApiService.swift
//  DigioNewProducts
//
//  Created by Marcell Ribeiro on 02/11/21.
//

import Foundation

fileprivate enum ApiMethods: String {
    case products
}

open class DigioApiService: DigioApiProtocol {
    let baseUrl = "https://7hgi9vtkdc.execute-api.sa-east-1.amazonaws.com/sandbox"
    let httpService: HttpServiceProtocol

    init(httpService: HttpServiceProtocol) {
        self.httpService = httpService
    }

    fileprivate func getUrlFor(method: ApiMethods) -> String {
        return "\(self.baseUrl)/\(method)"
    }

    func getProducts(completionHandler: @escaping (ProductsResponseModel?) -> Void) {
        let urlString = self.getUrlFor(method: ApiMethods.products)
        self.httpService.get(urlString: urlString) { (response) in
            guard let data = response.data else {
                completionHandler(nil)
                return
            }
            let decoder = JSONDecoder()

            do {
                let productsResponse = try decoder.decode(ProductsResponseModel.self, from: data)
                completionHandler(productsResponse)
            } catch {
                completionHandler(nil)
            }
        }
    }
}
