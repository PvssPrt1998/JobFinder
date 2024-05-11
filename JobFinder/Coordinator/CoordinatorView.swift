//
//  CoordinatorView.swift
//  JobFinder
//
//  Created by Николай Щербаков on 19.04.2024.
//

import SwiftUI

struct CoordinatorView<C: Coordinator>: View {
    
    @StateObject var coordinator: C
    
    @EnvironmentObject var viewModel: VacanciesViewModel
    var authenticated = false
    
    var body: some View {
//        NavigationStack(path: $coordinator.path) {
//                coordinator.build(page: .signInScreen)
//                    .navigationDestination(for: Page.self) { page in
//                        coordinator.build(page: page)
//                    }
//            }
//        .environmentObject(coordinator)
        
        coordinator.build(screen: InitialPage.mainScreen)
    }
}

struct CoordinatorView_Previews: PreviewProvider {
    static var previews: some View {
        CoordinatorView(coordinator: InitialCoordinator())
            .environmentObject(VacanciesViewModel())
    }
}
