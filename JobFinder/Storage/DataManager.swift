//
//  DataManager.swift
//  JobFinder
//
//  Created by Николай Щербаков on 30.06.2024.
//

import Foundation

final class DataManager {
    
    let decoder = JSONDecoder()
    
    let localStorage = LocalStorage()
    
    private func save<T: Encodable>(_ object: T, to fileName: String) throws {
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
    
    func fetchData() -> Model? {
        guard let url = getURL() else {
            fatalError("No file named: data.json in Bundle")
        }
        if let item = try? retrieve(Model.self, from: url) {
            return item
        }
        return nil
    }

    private func retrieve<T: Codable>(_ type: T.Type, from fileName: String) throws -> T {
        try retrieve(T.self, from: createDocumentURL(withFileName: fileName))
    }
    
    private func retrieve<T: Codable>(_ type: T.Type, from url: URL) throws -> T {
        do {
            let data = try Data(contentsOf: url)
            return try decoder.decode(T.self, from: data)
        } catch (let error) {
            print("Retrieve failed: URL: `\(url)`, Error: `\(error)`")
            throw error
        }
    }
    
    private func createDocumentURL(withFileName fileName: String) -> URL {
        FileManager.default
            .urls(for: .documentDirectory, in: .userDomainMask).first!
            .appendingPathComponent(fileName).appendingPathExtension("json")
    }
    
    private func getURL() -> URL? {
        Bundle.main.url(forResource: "data.json", withExtension: nil)
    }
}
