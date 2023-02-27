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
    @Published var image: UIImage?
    
    func getBook(category: BookList) {
        fetch(category.encodedName)
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
    
//     func fetchCover(isbn: String) {
//        guard let url = URL(string: "https://covers.openlibrary.org/b/isbn/\(isbn)-M.jpg") else { return }
//        URLSession.shared.dataTaskPublisher(for: url)
//               .map { image in
//                   
//                   
//               }
//               .replaceError(with: nil)
//               .receive(on: DispatchQueue.main)
//               .assign(to: \.image, on: self)
//               .store(in: &cancellableSet)
//       }
}
