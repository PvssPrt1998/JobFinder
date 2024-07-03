//
//  FavoriteCoordinator.swift
//  JobFinder
//
//  Created by Николай Щербаков on 03.07.2024.
//

import SwiftUI
import Combine

final class FavoriteViewCoordinator: ObservableObject {
    
    @Published var router: NavigationRouter = NavigationRouter(path: NavigationPath())
    
    var viewModelFactory: ViewModelFactory
    
    var routerCancellable: AnyCancellable?
    var viewCancellable: AnyCancellable?
    
    init(viewModelFactory: ViewModelFactory) {
        self.viewModelFactory = viewModelFactory
        
        routerCancellable = self.router.objectWillChange.sink { [weak self] _ in
            self?.objectWillChange.send()
        }
    }
    
    @ViewBuilder func build() -> some View {
        favoriteView()
    }
    
    private func favoriteView() -> some View {
        let favoriteViewModel = viewModelFactory.makeFavoriteViewModel()
        viewCancellable = favoriteViewModel.didTapCard
            .receive(on: DispatchQueue.main)
            .sink { [weak self] vacancyId in
                self?.makeVacancyCoordinator(vacancyId: vacancyId)
            }
        return FavoriteView(viewModel: favoriteViewModel)
    }
    
    private func makeVacancyCoordinator(vacancyId: String) {
        router.push(VacancyCoordinator(viewModelFactory: viewModelFactory, vacancyId: vacancyId))
    }
}
