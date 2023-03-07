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
    
    
    func getBestSeller(_ title: String) {
        fetchBestSeller(title)
             .sink { bestsellerModel in
                 
                 guard let result = bestsellerModel?.results else { return }
                 self.bestSellers = result
             }
             .store(in: &cancellableSet)
    }
    
    func filterData() {
        
    }
   
    func fetchBestSeller(_ title: String) -> AnyPublisher<BestSellerModel?, Never> {
        networkService.sendRequest(BookRouter.getBestSeller(title: title).createURLRequest(), responseType: BestSellerModel.self)
            .map { (response: BestSellerModel) -> BestSellerModel in response}
            .mapError({ (error) -> Error in
                print(error)
                return error
            })
            .replaceError(with: nil)
            .eraseToAnyPublisher()
    }
    
    
}
