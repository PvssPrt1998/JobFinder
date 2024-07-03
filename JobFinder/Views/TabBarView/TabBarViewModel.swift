//
//  TabBarViewModel.swift
//  JobFinder
//
//  Created by Николай Щербаков on 26.06.2024.
//

import Foundation
import Combine

final class TabBarViewModel: ObservableObject {
    
    @Published var authenticated: Bool {
        didSet {
            if authenticated && !oldValue {
                selection = 0
            }
        }
    }
    
    @Published var selection = 0
    
    var authenticationController: AuthenticationController
    
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
