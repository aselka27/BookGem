//
//  EditViewModel.swift
//  BookGem
//
//  Created by саргашкаева on 13.03.2023.
//

import SwiftUI
import Combine



class EditViewModel: ObservableObject {
    
    
    @Published var name: String = ""
    @Published var email: String = ""
    @Published var isValid = false
    @Published var isButtonEnabled: Bool = false
    @Published var emptyNameMessage: String = ""

    private var cancellableSet: Set<AnyCancellable> = []
    
    private var addNamePublisher: AnyPublisher <Bool, Never> {
        $name
            .map{ !$0.isEmpty }
            .eraseToAnyPublisher()
    }
    
    private var addEmailPublisher:  AnyPublisher <Bool, Never> {
        $email
            .map { !$0.isEmpty}
            .eraseToAnyPublisher()
    }
    
    private func isButtonEnabledPublisher() -> AnyPublisher <Bool, Never> {
        Publishers.CombineLatest(addNamePublisher, addEmailPublisher)
            .map { $0 && $1 }
            .eraseToAnyPublisher()
    }
    
    init() {
        addNamePublisher
            .dropFirst()
            .receive(on: RunLoop.main)
            .map { isValidName in
                if !isValidName {
                    return "Please fill out name field"
                } else {
                    return ""
                }
            }
            .assign(to: \.emptyNameMessage, on: self)
            .store(in: &cancellableSet)
        isButtonEnabledPublisher()
            .receive(on: RunLoop.main)
            .assign(to: \.isButtonEnabled, on: self)
            .store(in: &cancellableSet)
    }
    
}
