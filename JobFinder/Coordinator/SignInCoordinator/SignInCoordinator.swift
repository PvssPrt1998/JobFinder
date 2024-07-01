//
//  SignInCoordinator.swift
//  JobFinder
//
//  Created by Николай Щербаков on 26.06.2024.
//

import SwiftUI

final class SignInCoordinator: ObservableObject, Hashable {
    
    private var id: UUID
    
    enum Pages {
        case signIn
        case codeConfirm
    }
    
    //@Published var router: NavigationRouter
    
    var viewModelFactory: ViewModelFactory
    
    init(viewModelFactory: ViewModelFactory) {
        self.id = UUID()
        self.viewModelFactory = viewModelFactory
    }
    
    @ViewBuilder func build() -> some View {
        
    }
    
    private func codeConfirmView() {
        
    }
    
    // MARK: Required methods for class to conform to Hashable
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
    
    static func == (lhs: SignInCoordinator, rhs: SignInCoordinator) -> Bool {
        return lhs.id == rhs.id
    }
}
