//
//  SignInAsEmployeeEnteredState.swift
//  JobFinder
//
//  Created by Николай Щербаков on 26.06.2024.
//

import Foundation

final class SignInAsEmployeeEnteredState: SignInAsEmployeeBaseState {
    override func toEmptyState() {
        context?.buttonDisabled = true
        context?.transition(to: SignInAsEmployeeEmptyState())
    }
    
    override func toErrorState() {
        context?.buttonDisabled = true
        context?.borderColor = .red
        context?.showErrorCaption = true
        context?.transition(to: SignInAsEmployeeErrorState())
    }
}
