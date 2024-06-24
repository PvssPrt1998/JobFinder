//
//  Router.swift
//  JobFinder
//
//  Created by Николай Щербаков on 23.06.2024.
//

import SwiftUI

final class NavigationRouter: ObservableObject {
    @Published var path: NavigationPath
    
    init(path: NavigationPath) {
        self.path = path
    }
    
    func push<T: Hashable>(_ coordinator: T) {
        path.append(coordinator)
    }
}
