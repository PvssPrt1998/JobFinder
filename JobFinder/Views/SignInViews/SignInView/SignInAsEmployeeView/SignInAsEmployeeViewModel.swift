//
//  SignInAsEmployeeViewModel.swift
//  JobFinder
//
//  Created by Николай Щербаков on 25.06.2024.
//

import SwiftUI
import Combine

final class SignInAsEmployeeViewModel: ObservableObject {
    
    var authenticationController: AuthenticationController
    
    let didClickButton = PassthroughSubject<Bool, Never>()
    
    @Published var text = "" {
        didSet {
            textChanged(oldValue: oldValue)
        }
    }
    
    var buttonDisabled = true
    var borderColor: Color?
    var showErrorCaption = false
    
    @Published var state: SignInAsEmployeeViewState
    
    init(authenticationController: AuthenticationController) {
        self.authenticationController = authenticationController
        self.state = SignInAsEmployeeEmptyState()
        state.update(context: self)
    }
    
    func buttonAction() {
        if text.isValidEmail() {
            authenticationController.email = text
            text = ""
            didClickButton.send(true)
        } else {
            toErrorState()
        }
    }
    
    func clearButtonAction() {
        text = ""
    }
    
    private func textChanged(oldValue: String) {
        textFromEmptyToEntered(oldValue: oldValue)
        textFromEnteredToEmpty(oldValue: oldValue)
        textFromEnteredToError(oldValue: oldValue)
    }
    
    private func textFromEmptyToEntered(oldValue: String) {
        if text != "" && oldValue == "" {
            toEnteredState()
        }
    }
    
    private func textFromEnteredToEmpty(oldValue: String) {
        if text == "" && oldValue != "" {
            toEmptyState()
        }
    }
    
    private func textFromEnteredToError(oldValue: String) {
        if oldValue != "" && isErrorState() {
            if text == "" {
                toEmptyState()
            }
            if text != "" {
                toEnteredState()
            }
        }
    }
}

extension  SignInAsEmployeeViewModel: SignInAsEmployeeViewContext  {
    func transition(to state: SignInAsEmployeeViewState) {
        self.state = state
        self.state.update(context: self)
    }
    
    private func toEmptyState() {
        state.toEmptyState()
    }
    
    private func toEnteredState() {
        state.toEnteredState()
    }
    
    private func toErrorState() {
        state.toErrorState()
    }
    
    private func isErrorState() -> Bool {
        state is SignInAsEmployeeErrorState
    }
}

