//
//  VacanciesScrollViewModel.swift
//  JobFinder
//
//  Created by Николай Щербаков on 01.07.2024.
//

import SwiftUI
import Combine

final class VacanciesScrollViewModel: ObservableObject {
    
    var vacanciesController: VacanciesController
    
    let didTapCard = PassthroughSubject<String, Never>()
    
    @Published var vacancies: [Vacancy] = []
    @Published var detailedMode = false
    
    private var cancellables = Set<AnyCancellable>()
    
    init(vacanciesController: VacanciesController) {
        self.vacanciesController = vacanciesController
        
        vacanciesController.$vacancies.sink { [weak self] vacancies in
            self?.vacancies = vacancies
            self?.reduceArrayIfNeeded()
        }
        .store(in: &cancellables)
    }
    
    func buttonAction() {
        fillArray()
        detailedMode = true
    }
    
    func cardTapAction(vacancy: Vacancy) {
        didTapCard.send(vacancy.id)
    }
    
    func favoriteToggle(vacancyId: String) {
        vacanciesController.vacancyFavoriteToggle(vacancyId: vacancyId)
    }

    func hiddenVacanciesLine() -> String {
        "Ещё " + vacanciesController.vacanciesCountLine(vacanciesController.vacancies.count - 3)
    }
    
    private func reduceArrayIfNeeded() {
        if !detailedMode {
            while vacancies.count > 3 {
                vacancies.removeLast()
            }
        }
    }
    
    private func fillArray() {
        vacancies = vacanciesController.vacancies
    }
}
