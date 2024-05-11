//
//  ContentView.swift
//  JobFinder
//
//  Created by Николай Щербаков on 19.04.2024.
//

import SwiftUI

struct ContentView: View {
    
    var data = VacanciesViewModel()
    
    var body: some View {
        TabView {
            VacanciesView()
                .tabItem {
                    VStack {
                        Image("SearchIcon")
                            .foregroundStyle(.orange)
                        Text("Поиск")
                    }
                }
                .tag(0)
            FavouriteView()
                .tabItem {
                    VStack {
                        Image("HeartIcon")
                        Text("Избранное")
                    }
                }
                .tag(1)
            ResponsesView()
                .tabItem {
                    VStack {
                        Image("ResponsesIcon")
                        Text("Отклики")
                    }
                }
                .tag(2)
            MessagesView()
                .tabItem {
                    VStack {
                        Image("MessagesIcon")
                        Text("Сообщения")
                    }
                }
                .tag(3)
            ProfileView()
                .tabItem {
                    VStack {
                        Image("ProfileIcon")
                        Text("Профиль")
                    }
                }
                .tag(4)
        }
    }
}

#Preview {
    ContentView()
}


