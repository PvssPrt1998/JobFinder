//
//  SignInCodeConfirmCoordinator.swift
//  JobFinder
//
//  Created by Николай Щербаков on 27.06.2024.
//

import SwiftUI

final class SignInCodeConfirmCoordinator: ObservableObject, Hashable {
    
    private var id: UUID
    
    var viewModelFactory: ViewModelFactory
    
    init(viewModelFactory: ViewModelFactory) {
        self.id = UUID()
        self.viewModelFactory = viewModelFactory
    }
    
    @ViewBuilder func build() -> some View {
        SignInCodeConfirmView(viewModel: viewModelFactory.makeSignInCodeConfirmViewModel())
    }
    
    // MARK: Required methods for class to conform to Hashable
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
    
    static func == (lhs: SignInCodeConfirmCoordinator, rhs: SignInCodeConfirmCoordinator) -> Bool {
        return lhs.id == rhs.id
    }
}
