//
//  SignInCodeConfirmViewModel.swift
//  JobFinder
//
//  Created by Николай Щербаков on 27.06.2024.
//

import SwiftUI

final class SignInCodeConfirmViewModel: ObservableObject {
    
    var authenticationController: AuthenticationController
    
    var email: String {
        authenticationController.email ?? ""
    }
    
    init(authenticationController: AuthenticationController) {
        self.authenticationController = authenticationController
    }
    
    func buttonAction() {
        
    }
}
