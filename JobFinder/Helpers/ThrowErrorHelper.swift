//
//  ThrowErrorHelper.swift
//  JobFinder
//
//  Created by Николай Щербаков on 03.07.2024.
//

import Foundation

public func throwError<T>(_ error: Error) throws -> T {
    throw error
}
