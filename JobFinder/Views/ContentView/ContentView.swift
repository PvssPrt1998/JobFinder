//
//  TabBarView.swift
//  JobFinder
//
//  Created by Николай Щербаков on 23.06.2024.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject var viewModel: ContentViewModel
    var viewModelFactory: ViewModelFactory
    
    var body: some View {
        ZStack {
            TabBarView(coordinator: TabBarViewCoordinator(viewModelFactory: viewModelFactory), viewModel: viewModelFactory.makeTabBarViewModel())
            if !viewModel.authenticated {
                SignInContentView(signInCoordinator: SignInCoordinator(viewModelFactory: viewModelFactory))
            }
        }
    }
}

#Preview {
    ContentView(viewModel: ViewModelFactory().makeContentViewModel(), viewModelFactory: ViewModelFactory())
}
