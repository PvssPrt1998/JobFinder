//
//  RecomendationsViewModel.swift
//  JobFinder
//
//  Created by Николай Щербаков on 30.06.2024.
//

import Foundation
import Combine

final class OffersViewModel: ObservableObject {
    
    var vacanciesController: VacanciesController
    
    @Published var offers: [Offer] = []
    
    private var cancellables = Set<AnyCancellable>()
    
    init(vacanciesController: VacanciesController) {
        self.vacanciesController = vacanciesController
        offers = vacanciesController.offers
        
        vacanciesController.$offers.sink { [weak self] offers in
            self?.offers = offers
        }
        .store(in: &cancellables)
    }
}
