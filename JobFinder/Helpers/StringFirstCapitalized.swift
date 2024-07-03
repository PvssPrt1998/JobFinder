//
//  StringFirstCapitalized.swift
//  JobFinder
//
//  Created by Николай Щербаков on 03.07.2024.
//

import Foundation

extension StringProtocol {
    var firstUppercased: String { prefix(1).uppercased() + dropFirst() }
    var firstCapitalized: String { prefix(1).capitalized + dropFirst() }
}
