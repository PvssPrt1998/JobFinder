//
//  Vacancies.swift
//  JobFinder
//
//  Created by Николай Щербаков on 25.04.2024.
//

import Foundation
import Combine

final class VacanciesViewModel: ObservableObject {
    
    @Published var vacanciesController: VacanciesController
    
    @Published var detailedMode = false
    @Published var showLoadingView = true
    
    var recomendationsViewModel: OffersViewModel
    var vacanciesScrollViewModel: VacanciesScrollViewModel
    
    private var cancellables = Set<AnyCancellable>()
    
    init(vacanciesController: VacanciesController) {
        self.vacanciesController = vacanciesController
        self.recomendationsViewModel = OffersViewModel(vacanciesController: vacanciesController)
        self.vacanciesScrollViewModel = VacanciesScrollViewModel(vacanciesController: vacanciesController)
        self.vacanciesScrollViewModel.$detailedMode.sink { [weak self] detailed in
            self?.detailedMode = detailed
        }
        .store(in: &cancellables)
        
        self.vacanciesController.$dataLoaded.sink { [weak self] loaded in
                self?.showLoadingView = !loaded
            }
            .store(in: &cancellables)
    }
    
    func vacanciesCountLine() -> String {
        vacanciesController.vacanciesCountLine(vacanciesController.vacancies.count)
    }
}


