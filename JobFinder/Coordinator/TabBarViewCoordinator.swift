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
        case favouritePage
        case responsesPage
        case messagesPage
        case profilePage
    }
    
    @ViewBuilder func build(_ page: MainPages, authenticated: Bool) -> some View {
        if authenticated {
            switch page {
            case .vacanciesPage: VacanciesView()
            case .favouritePage: FavouriteView()
            case .responsesPage: ResponsesView()
            case .messagesPage: MessagesView()
            case .profilePage: ProfileView()
            }
        } else {
            EmptyScreenForTabView()
        }
    }
}
