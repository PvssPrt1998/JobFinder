//
//  VacanciesCoordinator.swift
//  JobFinder
//
//  Created by Николай Щербаков on 30.06.2024.
//

import SwiftUI
import Combine

final class VacanciesViewCoordinator: ObservableObject {
    
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
        vacanciesView()
    }
    
    private func vacanciesView() -> some View {
        let vacanciesViewModel = viewModelFactory.makeVacanciesViewModel()
        viewCancellable = vacanciesViewModel.vacanciesScrollViewModel.didTapCard
            .receive(on: DispatchQueue.main)
            .sink { [weak self] vacancyId in
                self?.makeVacancyCoordinator(vacancyId: vacancyId)
            }
        return VacanciesView(viewModel: vacanciesViewModel)
    }
    
    private func makeVacancyCoordinator(vacancyId: String) {
        router.push(VacancyCoordinator(viewModelFactory: viewModelFactory, vacancyId: vacancyId))
    }
}
