//
//  NetworkErrors.swift
//  BookGem
//
//  Created by саргашкаева on 20.02.2023.
//

import Foundation


enum NetworkErrors: Error {
    case badRequest
    case unauthorized
    case forbidden
    case notFound
    case success
    
    
    var message: String {
        switch self {
        case .badRequest:
            return ""
        case .unauthorized:
            return ""
        case .forbidden:
            return ""
        case .notFound:
            return ""
        case .success:
            return ""
        }
    }
}
