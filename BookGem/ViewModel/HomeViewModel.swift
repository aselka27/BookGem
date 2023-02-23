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


class HomeViewModel: HomeViewModelProtocol, ObservableObject {
   
    let networkService = NetworkService.shared
    @Published var searchText: String = ""
    @Published var allBooks: [Book] = []
    private var cancellableSet: Set<AnyCancellable> = []
    
    init() {
        getYoungAdult()
    }
   
    func getYoungAdult() {
       fetchBooks()
            .sink { bookModel in
                guard let result = bookModel?.results else { return }
                self.allBooks = result
            }
            .store(in: &cancellableSet)
    }
    
    func getScience() {
        
    }
    
    func getEducation() {
        
    }
    
    func getBusiness() {
        
    }
    
    func getManga() {
        
    }
    
    func addSubscribers() {
       
    }
    
    private func fetchBooks() ->  AnyPublisher<BookModel?, Never>  {
        networkService.sendRequest(BookRouter.getBooks(list: BookList.YoungAdult.encodedName).createURLRequest())
            .map { (response: BookModel) -> BookModel in response}
            .mapError({ (error) -> Error in
                print(error)
                return error
            })
            .replaceError(with: nil)
            .eraseToAnyPublisher()
    }
    
   
    
}
