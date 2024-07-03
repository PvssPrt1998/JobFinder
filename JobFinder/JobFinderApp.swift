//
//  JobFinderApp.swift
//  JobFinder
//
//  Created by Николай Щербаков on 19.04.2024.
//

import SwiftUI

@main
struct JobFinderApp: App {
    
    let viewModelFactory = ViewModelFactory()
    
    var body: some Scene {
        WindowGroup {
            ContentView(viewModel: viewModelFactory.makeContentViewModel(),
                        viewModelFactory: viewModelFactory)
                .preferredColorScheme(.dark)
        }
    }
}
