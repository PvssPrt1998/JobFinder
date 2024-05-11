//
//  Offer.swift
//  JobFinder
//
//  Created by Николай Щербаков on 05.05.2024.
//

import Foundation

class Offer: Codable {
    let id: String?
    let title: String
    let link: String
    let button: ButtonData?
    
    enum CodingKeys: CodingKey {
        case id
        case title
        case link
        case button
    }

    init(id: String?, title: String, link: String, button: ButtonData?) {
        self.id = id
        self.title = title
        self.link = link
        self.button = button
    }
}
