//
//  CategoryViewModel.swift
//  BookGem
//
//  Created by саргашкаева on 23.02.2023.
//

import SwiftUI
import Combine


class CategoryViewModel: ObservableObject {
    
   private let networkService = NetworkService.shared
    @Published var books: [Book] = []
    private var cancellableSet: Set<AnyCancellable> = []
    
    func getBook(category: String) {
        fetch(category)
             .sink { bookModel in
                 guard let result = bookModel?.results else { return }
                 self.books = result
             }
             .store(in: &cancellableSet)
    }
    
    private func fetch(_ category: String) ->  AnyPublisher<BookModel?, Never>  {
        networkService.sendRequest(BookRouter.getBooks(list: category).createURLRequest())
            .map { (response: BookModel) -> BookModel in response}
            .mapError({ (error) -> Error in
                print(error)
                return error
            })
            .replaceError(with: nil)
            .eraseToAnyPublisher()
    }
}
