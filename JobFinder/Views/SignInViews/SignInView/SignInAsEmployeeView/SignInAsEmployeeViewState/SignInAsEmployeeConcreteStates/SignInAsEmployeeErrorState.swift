//
//  SignInAsEmployeeErrorState.swift
//  JobFinder
//
//  Created by Николай Щербаков on 26.06.2024.
//

import Foundation

final class SignInAsEmployeeErrorState: SignInAsEmployeeBaseState {
    override func toEmptyState() {
        context?.borderColor = nil
        context?.showErrorCaption = false
        context?.transition(to: SignInAsEmployeeEmptyState())
    }
    
    override func toEnteredState() {
        context?.buttonDisabled = false
        context?.borderColor = nil
        context?.showErrorCaption = false
        context?.transition(to: SignInAsEmployeeEnteredState())
    }
}
