//
//  Vacancy.swift
//  JobFinder
//
//  Created by Николай Щербаков on 05.05.2024.
//

import Foundation

class Vacancy: Codable {
    let id: String
    let lookingNumber: Int?
    let title: String
    let address: Address
    let company: String
    let experience: Experience
    let publishedDate: String
    let isFavorite: Bool
    let salary: Salary
    let schedules: [String]
    let appliedNumber: Int?
    let description: String?
    let responsibilities: String
    let questions: [String]

    init(id: String, lookingNumber: Int?, title: String, address: Address, company: String, experience: Experience, publishedDate: String, isFavorite: Bool, salary: Salary, schedules: [String], appliedNumber: Int?, description: String?, responsibilities: String, questions: [String]) {
        self.id = id
        self.lookingNumber = lookingNumber
        self.title = title
        self.address = address
        self.company = company
        self.experience = experience
        self.publishedDate = publishedDate
        self.isFavorite = isFavorite
        self.salary = salary
        self.schedules = schedules
        self.appliedNumber = appliedNumber
        self.description = description
        self.responsibilities = responsibilities
        self.questions = questions
    }
}
