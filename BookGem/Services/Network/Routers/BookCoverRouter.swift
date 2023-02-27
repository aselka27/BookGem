//
//  BookCoverRouter.swift
//  BookGem
//
//  Created by саргашкаева on 27.02.2023.
//

import Foundation


enum BookCoverRouter: CoverRouter {

case getBookCover(isbn: String)
    
    
    var path: String {
        switch self {
        case .getBookCover(let isbn):
            return "/b/isbn/\(isbn)-M.jpg"
        }
    }
    
    var method: HttpMethod {
        switch self {
        case .getBookCover:
            return .GET
        }
    }
    
    var queryParameter: [URLQueryItem]? {
        switch self {
        case .getBookCover:
            return nil
        }
    }
    
    var httpBody: Data? {
        switch self {
        case .getBookCover:
            return nil
        }
    }
    
    var httpHeader: [HttpHeader]? {
        switch self {
        case .getBookCover:
            return nil
        }
    }
    

    
    
}
