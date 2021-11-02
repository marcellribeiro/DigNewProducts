//
//  UrlSessionHttpService.swift
//  DigioNewProducts
//
//  Created by Marcell Ribeiro on 02/11/21.
//

import Foundation

class UrlSessionHttpService: HttpServiceProtocol {
    func get(urlString: String, completionHandler: @escaping (ApiResponseModel) -> Void) {
        guard let url = URL(string: urlString) else {
            return
        }

        URLSession.shared.dataTask(with: url) { (data, response, error) in
            guard let httpResponse = response as? HTTPURLResponse else {
                let response = ApiResponseModel(
                    statusCode: 500,
                    data: nil,
                    error: true
                )
                completionHandler(response)
                return
            }
            let response: ApiResponseModel
            if let data = data {
                response = ApiResponseModel(
                    statusCode: httpResponse.statusCode,
                    data: data,
                    error: false
                )
            }
            else {
                response = ApiResponseModel(
                    statusCode: httpResponse.statusCode,
                    data: nil,
                    error: true
                )
            }

            completionHandler(response)
        }.resume()
    }
}
