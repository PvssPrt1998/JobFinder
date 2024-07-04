//
//  FavoriteViewModel.swift
//  JobFinder
//
//  Created by Николай Щербаков on 01.07.2024.
//

import Foundation
import Combine

final class FavoriteViewModel: ObservableObject {
    
    var vacanciesController: VacanciesController
    
    @Published var vacancies: [Vacancy] = []
    @Published var showLoadingView = true
    
    let didTapCard = PassthroughSubject<String, Never>()
    
    private var cancellables = Set<AnyCancellable>()
    
    init(vacanciesController: VacanciesController) {
        self.vacanciesController = vacanciesController
        
        vacanciesController.$vacancies.sink { [weak self] vacancies in
            self?.vacancies = vacancies.filter { $0.isFavorite }
        }
        .store(in: &cancellables)
        
        vacanciesController.$dataLoaded.sink { [weak self] loaded in
            self?.showLoadingView = !loaded
        }
        .store(in: &cancellables)
    }
    
    func cardTapAction(vacancyId: String) {
        didTapCard.send(vacancyId)
    }
    
    func favoriteVacanciesCountLine() -> String {
        vacanciesController.vacanciesCountLine( vacanciesController.favoriteVacanciesCount())
    }
    
    func favoriteToggle(vacancyId: String) {
        vacanciesController.vacancyFavoriteToggle(vacancyId: vacancyId)
    }
}
