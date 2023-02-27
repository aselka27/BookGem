//
//  BookCoverViewModel.swift
//  BookGem
//
//  Created by саргашкаева on 27.02.2023.
//

import SwiftUI
import Combine


class BookCoverViewModel: ObservableObject {
    
    @Published var image: UIImage?
    
    private var cancellableSet: Set<AnyCancellable> = []
    
    func fetchCover(isbn: String) {
       guard let url = URL(string: "https://covers.openlibrary.org/b/isbn/\(isbn)-M.jpg") else { return }
       URLSession.shared.dataTaskPublisher(for: url)
              .map { UIImage(data: $0.data) }
              .replaceError(with: nil)
              .receive(on: DispatchQueue.main)
              .assign(to: \.image, on: self)
              .store(in: &cancellableSet)
      }
    
}
