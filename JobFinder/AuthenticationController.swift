//
//  AuthenticationController.swift
//  JobFinder
//
//  Created by Николай Щербаков on 23.06.2024.
//

import Foundation

final class AuthenticationController: ObservableObject {
    @Published var authenticated = false
    var email: String?
}
