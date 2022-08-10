//
//  Model.swift
//  Capybara
//
//  Created by Brian Ruan on 8/9/22.
//

import Foundation

final class Model: ObservableObject {
    @Published var courses: [Course] = []
}
/// Initializes a new JSON file.
///
/// - Parameter path: Path to the ``fileName``
/// - Parameter fileName: Name of the file
/// - Returns: Void

private func createJson(path: URL, fileName: String) {
    // TODO: implement
}

/// Decode from JSON to any Codable type
///
/// - Parameter fileName: Name of the file
/// - Parameter appendingPath: Path of the directory in which the file should be decoded from
/// - Returns: Codable type, like ``Course``

func decodeJson<T: Decodable>(_ fileName: String, appendingPath: String? = nil) -> T {
    let decoder = JSONDecoder()
    decoder.dateDecodingStrategy = .iso8601
    
    let data: Data
    
    let fm = FileManager.default
    let path = fm.urls(for: .documentDirectory, in: .userDomainMask).first!
    let appendingPath = path.appendingPathComponent(appendingPath ?? "")
    if (!fm.fileExists(atPath: appendingPath.appendingPathComponent(fileName).path)) {
        createJson(path: appendingPath, fileName: fileName)
    }
    do {
        data = try Data(contentsOf: appendingPath.appendingPathComponent(fileName))
    } catch {
        // TODO: Replace fatalError's with something else for production use
        fatalError("\(error)")
    }
    
    do {
        return try decoder.decode(T.self, from: data)
    } catch {
        fatalError("\(error)")
    }
    
}

/// Encode from any Codable type to Data
///
/// - Parameter value: Codable type, like ``Course``
/// - Returns: Data, which can be encoded to JSON

private func encodeJson<T: Encodable>(_ value: T) -> Data {
    let encoder = JSONEncoder()
    encoder.dateEncodingStrategy = .iso8601
    encoder.outputFormatting = [.prettyPrinted, .sortedKeys]
    
    do {
        let data = try encoder.encode(value)
        return data
    } catch {
        fatalError("\(error)")
    }
}

func writeJson() {
    // TODO: implement
}

func reloadJson() {
    // TODO: implement
}
