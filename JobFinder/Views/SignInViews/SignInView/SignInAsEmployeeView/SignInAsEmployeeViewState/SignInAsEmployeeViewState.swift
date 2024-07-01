//
//  SignInAsEmployeeViewState.swift
//  JobFinder
//
//  Created by Николай Щербаков on 26.06.2024.
//

import Foundation

protocol SignInAsEmployeeViewState {
    func update(context: SignInAsEmployeeViewContext)
    
    func toEmptyState()
    func toEnteredState()
    func toErrorState()
}
