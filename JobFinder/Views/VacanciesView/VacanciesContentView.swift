//
//  VacanciesContentView.swift
//  JobFinder
//
//  Created by Николай Щербаков on 30.06.2024.
//

import SwiftUI

struct VacanciesContentView: View {
    
    @ObservedObject var vacanciesViewCoordinator: VacanciesViewCoordinator
    
    var body: some View {
        NavigationStack(path: $vacanciesViewCoordinator.router.path) {
            vacanciesViewCoordinator.build()
                .navigationDestination(for: VacancyCoordinator.self) { coordinator in
                    coordinator.build()
                }
        }
    }
}

#Preview {
    VacanciesContentView(vacanciesViewCoordinator: VacanciesViewCoordinator(viewModelFactory: ViewModelFactory()))
}
