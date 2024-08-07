//
//  Model.swift
//  JobFinder
//
//  Created by Николай Щербаков on 05.05.2024.
//

import Foundation

struct Model: Codable {
    let offers: [Offer]
    let vacancies: [Vacancy]
}
