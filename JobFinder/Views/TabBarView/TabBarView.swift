//
//  ContentView.swift
//  JobFinder
//
//  Created by Николай Щербаков on 19.04.2024.
//

import SwiftUI

struct TabBarView: View {
    
    @ObservedObject var coordinator: TabBarViewCoordinator
    @ObservedObject var viewModel: TabBarViewModel
    
    var body: some View {
        TabView(selection: $viewModel.selection) {
            coordinator.build(.vacanciesPage)
                .tabItem {
                    VStack {
                        image(.search, selection: viewModel.selection)
                        Text("Поиск")
                    }
                }
                .tag(0)
            coordinator.build(.favoritePage)
                .tabItem {
                    VStack {
                        image(.heart, selection: viewModel.selection)
                        Text("Избранное")
                    }
                }
                .tag(1)
            coordinator.build(.responsesPage)
                .tabItem {
                    VStack {
                        image(.response, selection: viewModel.selection)
                        Text("Отклики")
                    }
                }
                .tag(2)
            coordinator.build(.messagesPage)
                .tabItem {
                    VStack {
                        image(.message, selection: viewModel.selection)
                        Text("Сообщения")
                    }
                }
                .tag(3)
            coordinator.build(.profilePage)
                .tabItem {
                    VStack {
                        image(.profile, selection: viewModel.selection)
                        Text("Профиль")
                    }
                }
                .tag(4)
        }
    }
    
    @ViewBuilder func image(_ type: TabBarIcons, selection: Int) -> some View {
        switch type {
            case .search: selection == 0 ? Image(ImageTitles.selectedSearchIcon.rawValue) : Image(ImageTitles.searchIcon.rawValue)
            case .heart: selection == 1 ? Image(ImageTitles.selectedHeartIcon.rawValue) : Image(ImageTitles.heartIcon.rawValue)
            case .response: selection == 2 ? Image(ImageTitles.selectedResponseIcon.rawValue) : Image(ImageTitles.responseIcon.rawValue)
            case .message: selection == 3 ? Image(ImageTitles.selectedMessageIcon.rawValue) : Image(ImageTitles.messageIcon.rawValue)
            case .profile: selection == 4 ? Image(ImageTitles.selectedProfileIcon.rawValue) : Image(ImageTitles.profileIcon.rawValue)
        }
    }
}

#Preview {
    TabBarView(coordinator: TabBarViewCoordinator(viewModelFactory: ViewModelFactory()), viewModel: ViewModelFactory().makeTabBarViewModel())
}


