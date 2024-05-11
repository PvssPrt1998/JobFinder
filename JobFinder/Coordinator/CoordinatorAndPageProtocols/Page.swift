//
//  Page.swift
//  JobFinder
//
//  Created by Николай Щербаков on 11.05.2024.
//

import Foundation

protocol Page: RawRepresentable {
    var id: String { get }
}

extension Page where Self: RawRepresentable, RawValue == String {
    var id: String {
        self.rawValue
    }
}
