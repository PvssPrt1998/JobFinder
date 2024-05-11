//
//  Model.swift
//  JobFinder
//
//  Created by Николай Щербаков on 05.05.2024.
//

import Foundation

class Model: Codable {
    let offers: [Offer]
    let vacancies: [Vacancy]

    init(offers: [Offer], vacancies: [Vacancy]) {
        self.offers = offers
        self.vacancies = vacancies
    }
}
