//
//  Vacancies.swift
//  JobFinder
//
//  Created by Николай Щербаков on 25.04.2024.
//

import Foundation

class VacanciesViewModel {
    
    let decoder = JSONDecoder()
    
    var model: Model?
    
    init() {
        extractData()
        guard let model = model else { fatalError("noModel")}
        print(model.vacancies.first?.title)
    }
    
    func save<T: Encodable>(_ object: T, to fileName: String) throws {
        do {
            let encoder = JSONEncoder()
            let url = createDocumentURL(withFileName: fileName)
            let data = try encoder.encode(object)
            try data.write(to: url, options: .atomic)
        } catch (let error) {
            print("Save failed: Object: `\(object)`, " + "Error: `\(error)`")
            throw error
        }
    }
    
    func extractData() {
        guard let url = getURL() else {
            fatalError("No file named: data.json in Bundle")
        }
        if let item = try? retrieve(Model.self, from: url) {
            self.model = item
        }
    }

    public func retrieve<T: Codable>(_ type: T.Type, from fileName: String) throws -> T {
        try retrieve(T.self, from: createDocumentURL(withFileName: fileName))
    }
    
    public func retrieve<T: Codable>(_ type: T.Type, from url: URL) throws -> T {
        do {
            let data = try Data(contentsOf: url)
            return try decoder.decode(T.self, from: data)
        } catch (let error) {
            print("Retrieve failed: URL: `\(url)`, Error: `\(error)`")
            throw error
        }
    }
    
    public func createDocumentURL(withFileName fileName: String) -> URL {
        FileManager.default
            .urls(for: .documentDirectory, in: .userDomainMask).first!
            .appendingPathComponent(fileName).appendingPathExtension("json")
    }
    
    public func getURL() -> URL? {
        Bundle.main.url(forResource: "data.json", withExtension: nil)
    }
}

class Model: Codable {
    let offers: [Offer]
    let vacancies: [Vacancy]

    init(offers: [Offer], vacancies: [Vacancy]) {
        self.offers = offers
        self.vacancies = vacancies
    }
}

class Offer: Codable {
    let id: String?
    let title: String
    let link: String
    let button: ButtonJson?
    
    enum CodingKeys: CodingKey {
        case id
        case title
        case link
        case button
    }

    init(id: String?, title: String, link: String, button: ButtonJson?) {
        self.id = id
        self.title = title
        self.link = link
        self.button = button
    }
}

class ButtonJson: Codable {
    let text: String

    init(text: String) {
        self.text = text
    }
}

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

// MARK: - Address
class Address: Codable {
    let town, street, house: String

    init(town: String, street: String, house: String) {
        self.town = town
        self.street = street
        self.house = house
    }
}

// MARK: - Experience
class Experience: Codable {
    let previewText, text: String

    init(previewText: String, text: String) {
        self.previewText = previewText
        self.text = text
    }
}

// MARK: - Salary
class Salary: Codable {
    let full: String
    let short: String?

    init(full: String, short: String?) {
        self.full = full
        self.short = short
    }
}
