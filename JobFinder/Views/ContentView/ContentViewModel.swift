//
//  ContentViewModel.swift
//  JobFinder
//
//  Created by Николай Щербаков on 26.06.2024.
//

import SwiftUI
import Combine

final class ContentViewModel: ObservableObject {
    
    var authenticationController: AuthenticationController
    
    @Published var authenticated: Bool
    
    private var cancellables = Set<AnyCancellable>()
    
    init(authenticationController: AuthenticationController) {
        self.authenticationController = authenticationController
        self.authenticated = authenticationController.authenticated
        
        authenticationController.$authenticated.sink { [weak self] authenticated in
            self?.authenticated = authenticated
        }
        .store(in: &cancellables)
    }
}
