//
//  Experience.swift
//  JobFinder
//
//  Created by Николай Щербаков on 05.05.2024.
//

import Foundation

class Experience: Codable {
    let previewText, text: String

    init(previewText: String, text: String) {
        self.previewText = previewText
        self.text = text
    }
}
