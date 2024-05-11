//
//  Coordinator.swift
//  JobFinder
//
//  Created by Николай Щербаков on 19.04.2024.
//

import SwiftUI

protocol Coordinator: ObservableObject {

    associatedtype V: View
    
    func build(screen: any Page) -> V
}

