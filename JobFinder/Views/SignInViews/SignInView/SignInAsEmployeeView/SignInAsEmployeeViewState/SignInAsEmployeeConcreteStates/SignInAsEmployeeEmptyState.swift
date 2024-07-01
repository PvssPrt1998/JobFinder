//
//  SignInAsEmployeeEmptyState.swift
//  JobFinder
//
//  Created by Николай Щербаков on 26.06.2024.
//

import Foundation

final class SignInAsEmployeeEmptyState: SignInAsEmployeeBaseState {
    override func toEnteredState() {
        context?.buttonDisabled = false
        context?.transition(to: SignInAsEmployeeEnteredState())
    }
}
