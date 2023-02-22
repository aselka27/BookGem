//
//  BookRouter.swift
//  BookGem
//
//  Created by саргашкаева on 20.02.2023.
//

import Foundation


enum BookRouter: BaseRouter {
    
case getBooks(list: String)
case getBestSeller(date: String)
case getBookReview(bookTitle: String)
    
    var path: String {
        switch self {
        case .getBooks:
                return "/lists"
        case .getBestSeller:
            return "/lists/overview.json"
        
        case .getBookReview:
            return "/reviews.json"
        }
    }
    
    var method: HttpMethod {
        switch self {
         default:
            return .GET
        }
    }
    
    var queryParameter: [URLQueryItem]? {
        switch self {
        case .getBooks(let list):
            return [.init(name: "list", value: "\(list)")]
        case .getBestSeller(let date):
            return [.init(name: "published_date", value: "\(date)")]
        case .getBookReview(let bookTitle):
            return [.init(name: "title", value: "\(bookTitle)")]
        }
    }
    
    var httpBody: Data? {
        switch self {
        default:
            return nil
        }
    }
    
    var httpHeader: [HttpHeader]? {
        switch self {
        default:
            return nil
        }
    }
}
