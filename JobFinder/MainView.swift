//
//  MainView.swift
//  JobFinder
//
//  Created by Николай Щербаков on 19.04.2024.
//

import SwiftUI

struct MainView: View {
    
    @EnvironmentObject var viewModel: VacanciesViewModel
    
    var body: some View {
        ZStack {
            TabView {
                EmptyScreenForTabView()//VacanciesView()
                    .tabItem {
                        VStack {
                            Image("SearchIcon")
                                .foregroundStyle(.orange)
                            Text("Поиск")
                        }
                    }
                    .tag(0)
                EmptyScreenForTabView()//FavouriteView()
                    .tabItem {
                        VStack {
                            Image("HeartIcon")
                            Text("Избранное")
                        }
                    }
                    .tag(1)
                EmptyScreenForTabView()//ResponsesView()
                    .tabItem {
                        VStack {
                            Image("ResponsesIcon")
                            Text("Отклики")
                        }
                    }
                    .tag(2)
                EmptyScreenForTabView()//MessagesView()
                    .tabItem {
                        VStack {
                            Image("MessagesIcon")
                            Text("Сообщения")
                        }
                    }
                    .tag(3)
                EmptyScreenForTabView()//ProfileView()
                    .tabItem {
                        VStack {
                            Image("ProfileIcon")
                            Text("Профиль")
                        }
                    }
                    .tag(4)
            }
            if !viewModel.authenticated {
                SignInView()
                    .padding(.horizontal, 16)
            }
        }
    }
}

#Preview {
    MainView()
}
