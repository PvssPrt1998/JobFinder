//
//  SignInCoordinator.swift
//  JobFinder
//
//  Created by Николай Щербаков on 26.06.2024.
//

import SwiftUI
import Combine

final class SignInCoordinator: ObservableObject {
    
    @Published var router: NavigationRouter = NavigationRouter(path: NavigationPath())
    
    var viewModelFactory: ViewModelFactory
    
    private var routerAnyCancellable: AnyCancellable?
    private var viewCancellable: AnyCancellable?
    
    init(viewModelFactory: ViewModelFactory) {
        self.viewModelFactory = viewModelFactory
        
        routerAnyCancellable = self.router.objectWillChange.sink { [weak self] _ in
            self?.objectWillChange.send()
        }
    }
    
    @ViewBuilder func build() -> some View {
        signInView()
    }
    
    private func signInView() -> some View {
        let signInViewModel = viewModelFactory.makeSignInViewModel()
        viewCancellable = signInViewModel.signInAsEmployeeViewModel.didClickButton
            .receive(on: DispatchQueue.main)
            .sink { [weak self] didClick in
                self?.makeSignInCodeConfirmCoordinator()
            }
        return SignInView(viewModel: signInViewModel)
    }
    
    private func makeSignInCodeConfirmCoordinator() {
        router.push(SignInCodeConfirmCoordinator(viewModelFactory: viewModelFactory))
    }
}
