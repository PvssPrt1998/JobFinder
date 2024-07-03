//
//  Vacancy.swift
//  JobFinder
//
//  Created by Николай Щербаков on 05.05.2024.
//

import Foundation

struct Vacancy: Codable, Hashable {
    let id: String
    let lookingNumber: Int?
    let title: String
    let address: Address
    let company: String
    let experience: Experience
    let publishedDate: String
    var isFavorite: Bool
    let salary: Salary
    let schedules: [String]
    let appliedNumber: Int?
    let description: String?
    let responsibilities: String
    let questions: [String]
    
    static func == (lhs: Vacancy, rhs: Vacancy) -> Bool {
        return lhs.id == rhs.id
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
}
