//
//  SignInCodeConfirmViewModel.swift
//  JobFinder
//
//  Created by Николай Щербаков on 27.06.2024.
//

import SwiftUI

final class SignInCodeConfirmViewModel: ObservableObject {
    
    var authenticationController: AuthenticationController
    
    @Published var first: String = "" {
        didSet {
            isAllEntered()
        }
    }
    
    @Published var second: String = "" {
        didSet {
            isAllEntered()
        }
    }
    
    @Published var third: String = "" {
        didSet {
            isAllEntered()
        }
    }
    
    @Published var fourth: String = "" {
        didSet {
            isAllEntered()
        }
    }
    
    @Published var buttonDisabled = true
    
    var email: String {
        authenticationController.email ?? ""
    }
    
    init(authenticationController: AuthenticationController) {
        self.authenticationController = authenticationController
    }
    
    private func isAllEntered() {
        if first != "" && second != "" && third != "" && fourth != "" {
            buttonDisabled = false
        } else {
            buttonDisabled = true
        }
    }
    
    func buttonAction() {
        authenticationController.authenticated = true
    }
}
