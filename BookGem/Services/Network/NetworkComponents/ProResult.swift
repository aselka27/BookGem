//
//  ProResult.swift
//  BookGem
//
//  Created by саргашкаева on 20.02.2023.
//

import Foundation


enum ProResult <Success> {
    case success(Success)
    case badRequest(FailureModel)
    case unauthorized(String)
    case notFound(FailureModel)
    case failure(String)
}
