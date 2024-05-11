//
//  InitialCoordinator.swift
//  JobFinder
//
//  Created by Николай Щербаков on 11.05.2024.
//

import SwiftUI

class InitialCoordinator: Coordinator {
    @ViewBuilder func build(screen: any Page) -> some View {
        
        switch pageAsInitialPage(screen: screen) {
            case .mainScreen: MainView()
            default: Text("")
        }
    }
    
    func pageAsInitialPage(screen: any Page) -> InitialPage? {
        screen as? InitialPage
    }
}
