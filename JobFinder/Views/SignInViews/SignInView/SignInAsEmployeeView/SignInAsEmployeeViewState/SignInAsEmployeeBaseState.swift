//
//  SignInAsEmployeeBaseState.swift
//  JobFinder
//
//  Created by Николай Щербаков on 26.06.2024.
//

import Foundation

class SignInAsEmployeeBaseState: SignInAsEmployeeViewState {
    
    private(set) weak var context: SignInAsEmployeeViewContext?
    
    func update(context: SignInAsEmployeeViewContext) {
        self.context = context
    }
    
    func toEmptyState() { }
    func toEnteredState() { }
    func toErrorState() { }
}
