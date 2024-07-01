//
//  SignInViewModel.swift
//  JobFinder
//
//  Created by Николай Щербаков on 25.06.2024.
//

import Foundation
import Combine

final class SignInViewModel: ObservableObject {
    
    var signInAsEmployeeViewModel: SignInAsEmployeeViewModel
    
    init(authenticationController: AuthenticationController) {
        self.signInAsEmployeeViewModel = SignInAsEmployeeViewModel(authenticationController: authenticationController)
    }
}
