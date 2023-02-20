//
//  NetworkService.swift
//  BookGem
//
//  Created by саргашкаева on 20.02.2023.
//

import UIKit
import Combine
import SwiftUI


class NetworkService {
    static let shared = NetworkService()
    
    static let jsonDecoder: JSONDecoder = {
        let decoder = JSONDecoder()
        return decoder
    }()
    
    func sendRequest<T: Decodable>(_ request: URLRequest) -> AnyPublisher<T, Error> {
        URLSession.shared.dataTaskPublisher(for: request)
            .map {
                print(request.url)
                let str = String(data: $0.data, encoding: .utf8)!.data(using: .utf8)!.prettyJson
                if let str = str {
                    print(request.url, str)
                }
                return $0.data }
            .decode(type: T.self, decoder: NetworkService.jsonDecoder)
            .receive(on: RunLoop.main)
            .eraseToAnyPublisher()
    }
}


extension Data {
    var prettyJson: String? {
        guard let object = try? JSONSerialization.jsonObject(with: self, options: []),
              let data = try? JSONSerialization.data(withJSONObject: object, options: [.prettyPrinted]),
              let prettyPrintedString = String(data: data, encoding:.utf8) else { return nil }
        
        return prettyPrintedString
    }
}
