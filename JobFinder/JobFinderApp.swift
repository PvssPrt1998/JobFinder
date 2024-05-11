//
//  JobFinderApp.swift
//  JobFinder
//
//  Created by Николай Щербаков on 19.04.2024.
//

import SwiftUI

@main
struct JobFinderApp: App {
    var body: some Scene {
        WindowGroup {
            CoordinatorView(coordinator: InitialCoordinator())
                .preferredColorScheme(.dark)
                .environmentObject(VacanciesViewModel())
                
        }
    }
}
