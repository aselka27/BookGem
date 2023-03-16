//
//  DiscoverViewModel.swift
//  BookGem
//
//  Created by саргашкаева on 27.02.2023.
//

import SwiftUI
import Combine


class DiscoverViewModel: ObservableObject {
    
    @Published var bestSellers: [BestSellerInfo] = []
    @Published var searchText: String = ""
    private let networkService = NetworkService.shared
    private var cancellableSet: Set<AnyCancellable> = []
    var viewState = ViewStates.loading
    
    
    init() {
        getBestsellers()
        filterData()
    }
    

    func filterData() {
        $searchText
            .combineLatest($bestSellers)
            .map({ text, startingBestsellers -> [BestSellerInfo] in
                guard !text.isEmpty else {
                    return self.bestSellers
                }
                let lowercasedText = text.lowercased()
                let filteredBestsellers = startingBestsellers.filter { (book) -> Bool in
                    return book.title?.lowercased().contains(lowercasedText) ?? false
                }
                return filteredBestsellers
            })
            .sink { [weak self] returnedBestsellers in
                self?.bestSellers = returnedBestsellers
            }
            .store(in: &cancellableSet)
    }
 
    func getBestsellers() {
        networkService.sendRequest(BookRouter.getBestSeller(title: "Harry Potter").createURLRequest(), responseType: BestSellerModel.self)
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
            } receiveValue: { bestsellerModel in
                guard let bestsellers = bestsellerModel.results else { return }
                self.bestSellers = bestsellers
            }
            .store(in: &cancellableSet)
    }
}
