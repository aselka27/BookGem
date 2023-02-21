//
//  HomeViewModel.swift
//  BookGem
//
//  Created by саргашкаева on 20.02.2023.
//

import Combine
import SwiftUI

protocol HomeViewModelProtocol {
    func getYoungAdult()
    func getScience()
    func getEducation()
    func getBusiness()
    func getManga()
}


class HomeViewModel: HomeViewModelProtocol {
   
    let networkService = NetworkService.shared
   
    func getYoungAdult() {
        networkService.sendRequest(BookRouter.getBooks(list: BookList.YoungAdult.encodedName).createURLRequest())
            .map { (response: [BookModel]) -> [BookModel] in response}
            .mapError({ (error) -> Error in
                print(error)
                return error
            })
            .replaceError(with: [])
            .eraseToAnyPublisher()
    }
    
    func getScience() {
        
    }
    
    func getEducation() {
        
    }
    
    func getBusiness() {
        
    }
    
    func getManga() {
        
    }
    
   
    
}
