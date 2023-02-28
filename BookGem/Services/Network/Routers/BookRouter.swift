//
//  BookRouter.swift
//  BookGem
//
//  Created by саргашкаева on 20.02.2023.
//

import Foundation


enum BookRouter: BaseRouter {
    
case getBooks(list: String)
case getBestSeller(title: String)
case getBookReview(bookTitle: String)
    
    var path: String {
        switch self {
        case .getBooks:
                return "/svc/books/v3/lists.json"
        case .getBestSeller:
            return "/svc/books/v3/lists/best-sellers/history.json"
        
        case .getBookReview:
            return "/svc/books/v3/reviews.json"
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
            return [.init(name: "list", value: "\(list)"), .init(name: "api-key", value: "Jgh2eiFEEXTmBaBT0GjYxYYsE7V2H6s3")]
        case .getBestSeller(let title):
            return [.init(name: "title", value: "\(title)"), .init(name: "api-key", value: "Jgh2eiFEEXTmBaBT0GjYxYYsE7V2H6s3")]
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
