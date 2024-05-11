//
//  InitialCoordinator.swift
//  JobFinder
//
//  Created by Николай Щербаков on 11.05.2024.
//

import SwiftUI

class InitialCoordinator: Coordinator {
    @ViewBuilder func build(screen: any Page) -> some View {
        let a = screen as? InitialPage
        if a == nil {Text("")} else {
            switch a! {
                case .mainScreen: MainView()
            }
        }
    }
}
