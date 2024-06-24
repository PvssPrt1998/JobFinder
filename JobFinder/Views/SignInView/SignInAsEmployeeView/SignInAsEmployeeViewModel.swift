//
//  SignInAsEmployeeViewModel.swift
//  JobFinder
//
//  Created by Николай Щербаков on 25.06.2024.
//

import Foundation

final class SignInAsEmployeeViewModel: ObservableObject {
    
    var authenticationController: AuthenticationController
    
    @Published var text = "" {
        didSet {
            if text == "" {
                buttonDisabled = true
            }
            if text != "" {
                buttonDisabled = false
            }
            if errorMode {
                errorMode = false
            }
        }
    }
    
    var buttonDisabled = true
    @Published var errorMode: Bool = false
    
    init(authenticationController: AuthenticationController) {
        self.authenticationController = authenticationController
    }
    
    func buttonAction() {
        if isValidEmail(text) {
            authenticationController.authenticated = true
        } else {
            errorMode = true
        }
    }
    
    func clearButtonAction() {
        text = ""
    }
    
    func isValidEmail(_ email: String) -> Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"

        let emailPred = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailPred.evaluate(with: email)
    }
}
