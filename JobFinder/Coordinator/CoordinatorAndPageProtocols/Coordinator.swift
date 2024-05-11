//
//  Coordinator.swift
//  JobFinder
//
//  Created by Николай Щербаков on 19.04.2024.
//

import SwiftUI

protocol Coordinator: ObservableObject {
    
    //associatedtype E: RawRepresentable where E.RawValue == String
    associatedtype V: View
    
    func build(screen: any Page) -> V
}

//class Coordinator<T: Identifiable>: ObservableObject {
//    
//    @Published var path = NavigationPath()
//    @EnvironmentObject var viewModel: VacanciesViewModel
//    
//    func push(_ page: Page) {
//        path.append(page)
//    }
//    
//    func pop() {
//        path.removeLast()
//    }
//    
//    func popToRoot() {
//        path.removeLast(path.count)
//    }
//}
//
//extension Coordinator {
//    @ViewBuilder
//    func build(page: T) -> some View {
//        
//    }
//}


