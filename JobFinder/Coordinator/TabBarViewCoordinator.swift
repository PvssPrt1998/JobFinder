//
//  ContentViewCoordinator.swift
//  JobFinder
//
//  Created by Николай Щербаков on 23.06.2024.
//

import SwiftUI
import Combine

final class TabBarViewCoordinator: ObservableObject {
    
    enum MainPages {
        case vacanciesPage
        case favoritePage
        case responsesPage
        case messagesPage
        case profilePage
    }
    
    var viewModelFactory: ViewModelFactory
    
    private var cancellables = Set<AnyCancellable>()
    
    init(viewModelFactory: ViewModelFactory) {
        self.viewModelFactory = viewModelFactory
        
        viewModelFactory.authenticationController.$authenticated.sink { _ in
            self.objectWillChange.send()
        }
        .store(in: &cancellables)
    }
    
    @ViewBuilder func build(_ page: MainPages) -> some View {
        if viewModelFactory.authenticationController.authenticated {
            switch page {
                case .vacanciesPage: VacanciesContentView(vacanciesViewCoordinator: VacanciesViewCoordinator(viewModelFactory: viewModelFactory))
                case .favoritePage:  FavoriteContentView(favoriteViewCoordinator: FavoriteViewCoordinator(viewModelFactory: viewModelFactory))
                case .responsesPage: ResponsesView()
                case .messagesPage: MessagesView()
                case .profilePage: ProfileView()
            }
        } else {
            EmptyScreenForTabView()
        }
    }
}
