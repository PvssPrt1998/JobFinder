//
//  TabBarView.swift
//  JobFinder
//
//  Created by Николай Щербаков on 23.06.2024.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject var authController: AuthenticationController
    @ObservedObject var coordinator: MainCoordinator
    
    var body: some View {
        ZStack {
            coordinator.build(.tabBarPage)
            //TabBarView(coordinator: TabBarViewCoordinator(), authController: authController)
            if !authController.authenticated {
                SignInView(viewModel: SignInViewModel(authenticationController: authController))
                    .padding(16)
            }
        }
    }
}

#Preview {
    ContentView(authController: AuthenticationController(), coordinator: MainCoordinator())
}
