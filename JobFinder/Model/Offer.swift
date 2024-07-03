//
//  Offer.swift
//  JobFinder
//
//  Created by Николай Щербаков on 05.05.2024.
//

import Foundation

struct Offer: Codable, Hashable {
    
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
    
    static func == (lhs: Offer, rhs: Offer) -> Bool {
        return lhs.title == rhs.title
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
}
