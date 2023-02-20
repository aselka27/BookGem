//
//  BaseRouter.swift
//  BookGem
//
//  Created by саргашкаева on 20.02.2023.
//

import Foundation


protocol BaseRouter {
    var path: String { get }
    var method: HttpMethod { get }
    var queryParameter: [URLQueryItem]? { get }
    var httpBody: Data? { get }
    var httpHeader: [HttpHeader]? { get }
}


extension BaseRouter {
    var host: String {
        return "api.nytimes.com/svc/books/v3"
    }
    var scheme: String {
        return "https"
    }
    
    func createURLRequest() -> URLRequest {
        var urlComponents = URLComponents()
        urlComponents.scheme = scheme
        urlComponents.host = host
        urlComponents.path = path
        urlComponents.queryItems = queryParameter
        
        guard let url = urlComponents.url else {
            fatalError(URLError(.unsupportedURL).localizedDescription)
        }
        
        let stringURL = url.absoluteString.replacingOccurrences(of: ";", with: ":")
        var urlRequest = URLRequest(url: URL(string: stringURL)!)
        urlRequest.httpMethod = method.rawValue
        urlRequest.httpBody = httpBody
        httpHeader?.forEach { (header) in
            urlRequest.setValue(header.value, forHTTPHeaderField: header.field)
        }
        urlRequest.setValue("application/json", forHTTPHeaderField: "Content-Type")
        urlRequest.setValue("application/json", forHTTPHeaderField: "Accept")
        
        print(url)
        return urlRequest
    }
}
