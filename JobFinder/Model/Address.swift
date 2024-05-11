//
//  Address.swift
//  JobFinder
//
//  Created by Николай Щербаков on 05.05.2024.
//

import Foundation

class Address: Codable {
    let town, street, house: String

    init(town: String, street: String, house: String) {
        self.town = town
        self.street = street
        self.house = house
    }
}
