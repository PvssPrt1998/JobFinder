//
//  Salary.swift
//  JobFinder
//
//  Created by Николай Щербаков on 05.05.2024.
//

import Foundation

class Salary: Codable {
    let full: String
    let short: String?

    init(full: String, short: String?) {
        self.full = full
        self.short = short
    }
}
