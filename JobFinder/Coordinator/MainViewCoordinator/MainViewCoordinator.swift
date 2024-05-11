//
//  MainViewCoordinator.swift
//  JobFinder
//
//  Created by Николай Щербаков on 11.05.2024.
//

import SwiftUI

class MainViewCoordinator: Coordinator {
    @ViewBuilder func build(screen: any Page) -> some View {
        
        switch pageAsMainViewPages(screen: screen) {
        case .signInScreen: SignInView()
        case .vacanciesScreen: VacanciesView()
        case .favouriteScreen: FavouriteView()
        case .messagesScreen: MessagesView()
        case .responsesScreen: ResponsesView()
        case .profileScreen: ProfileView()
        case .emptyScreen: EmptyScreenForTabView()
        default: Text("Cannot show screen")
        }
    }
    
    private func pageAsMainViewPages(screen: any Page) -> MainViewPages? {
        screen as? MainViewPages
    }
}

