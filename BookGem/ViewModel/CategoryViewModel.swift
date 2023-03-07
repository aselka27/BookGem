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
    
//    func getBook(category: BookList) {
//        fetch(category.encodedName)
//             .sink { bookModel in
//                 guard let result = bookModel?.results else { return }
//                 self.books = result
//             }
//             .store(in: &cancellableSet)
//    }
    
     func fetch(_ category: BookList) {
        networkService.sendRequest(BookRouter.getBooks(list: category.name).createURLRequest(), responseType: BookModel.self)
            .sink { completion in
                switch completion {
                case .finished:
                    print("Completed")
                case .failure(let error):
                    switch error {
                    case .badRequest:
                        print("bad request")
                    case .unauthorized:
                        print("log in again")
                    case .forbidden:
                        print("")
                    case .notFound:
                        print("not found")
                    case .success:
                        print("suc")
                    }
                }
            } receiveValue: { bookModel in
                guard let result = bookModel.results else { return }
                self.books = result
            }
            .store(in: &cancellableSet)

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



/*
 guard case .failure(let error) = completion else { return }
             if case .decode(let data) = error {
                 if let authError = try? JSONDecoder().decode(AuthorizationErrorResponse.self, from: data) {
                     print(authError.data.first?.message ?? "")
                 } else {
                     print("Stories Decode Problem")
                 }
             }
 */
