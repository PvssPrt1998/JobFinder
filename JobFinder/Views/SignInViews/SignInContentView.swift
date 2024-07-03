//
//  SignInContentView.swift
//  JobFinder
//
//  Created by Николай Щербаков on 27.06.2024.
//

import SwiftUI

struct SignInContentView: View {
    
    @ObservedObject var signInCoordinator: SignInCoordinator

    var body: some View {
        NavigationStack(path: $signInCoordinator.router.path) {
            signInCoordinator.build()
                .navigationDestination(for: SignInCodeConfirmCoordinator.self) { coordinator in
                    coordinator.build()
                }
        }
        .padding(.bottom, UITabBarController().height)
    }
}

#Preview {
    SignInContentView(signInCoordinator: SignInCoordinator(viewModelFactory: ViewModelFactory()))
}

