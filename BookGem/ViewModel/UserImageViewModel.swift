//
//  UserImageViewModel.swift
//  BookGem
//
//  Created by саргашкаева on 22.02.2023.
//


import UIKit



class UserImageViewModel: ObservableObject {
    @Published var image: UIImage? = UIImage(named: "pedro")
    @Published var isLoading: Bool = false
    
    init() {
        getImage()
    }
    
    private func getImage() {
        
    }
}
