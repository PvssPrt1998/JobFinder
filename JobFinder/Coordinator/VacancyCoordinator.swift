//
//  VacancyView.swift
//  JobFinder
//
//  Created by Николай Щербаков on 30.06.2024.
//

import SwiftUI

final class VacancyCoordinator: ObservableObject, Hashable {
    
    private var id: UUID
    
    var viewModelFactory: ViewModelFactory
    var vacancyId: String
    
    init(viewModelFactory: ViewModelFactory, vacancyId: String) {
        self.id = UUID()
        self.viewModelFactory = viewModelFactory
        self.vacancyId = vacancyId
    }
    
    @ViewBuilder func build() -> some View {
        VacancyView(viewModel: viewModelFactory.makeVacancyViewModel(vacancyId: vacancyId))
    }
    
    // MARK: Required methods for class to conform to Hashable
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
    
    static func == (lhs: VacancyCoordinator, rhs: VacancyCoordinator) -> Bool {
        return lhs.id == rhs.id
    }
}
