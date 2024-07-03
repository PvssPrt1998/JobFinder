//
//  FavoriteContentView.swift
//  JobFinder
//
//  Created by Николай Щербаков on 03.07.2024.
//

import SwiftUI

struct FavoriteContentView: View {
    
    @ObservedObject var favoriteViewCoordinator: FavoriteViewCoordinator
    
    var body: some View {
        NavigationStack(path: $favoriteViewCoordinator.router.path) {
            favoriteViewCoordinator.build()
                .navigationDestination(for: VacancyCoordinator.self) { coordinator in
                    coordinator.build()
                }
        }
    }
}

#Preview {
    FavoriteContentView(favoriteViewCoordinator: FavoriteViewCoordinator(viewModelFactory: ViewModelFactory()))
}
