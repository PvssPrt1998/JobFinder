//
//  SignInAsEmployeeViewContext.swift
//  JobFinder
//
//  Created by Николай Щербаков on 26.06.2024.
//

import SwiftUI

protocol SignInAsEmployeeViewContext: AnyObject {
    var buttonDisabled: Bool { get set }
    var borderColor: Color? { get set }
    var showErrorCaption: Bool { get set }
    
    func transition(to state: SignInAsEmployeeViewState)
}
