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
    
    func sendRequest<T: Decodable>(_ request: URLRequest, responseType: T.Type) -> AnyPublisher<T, NetworkErrors> {
        URLSession.shared.dataTaskPublisher(for: request)
            .map { $0.data }
            .decode(type: T.self, decoder: NetworkService.jsonDecoder)
            .receive(on: RunLoop.main)
            .mapError({ error -> NetworkErrors in
                switch error {
                case URLError.badURL:
                    return .badRequest
                case URLError.userAuthenticationRequired:
                    return .unauthorized
                default:
                    return .notFound
                }
            })
            .eraseToAnyPublisher()
    }
}
