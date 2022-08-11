//
//  Model.swift
//  Capybara
//
//  Created by Brian Ruan on 8/9/22.
//

import Foundation

final class Model: ObservableObject {
    @Published var courses: [Course] = decodeJson("userdata.json")
}

/// Initializes a new JSON file.
///
/// - Parameter path: Path to the ``fileName``
/// - Parameter fileName: Name of the file
/// - Returns: Void

private func createJson(path: URL, fileName: String) {
    let emptyJsonArray: [String] = []
    let data = encodeJson(emptyJsonArray)
    
    let fm = FileManager.default
    do {
        try fm.createDirectory(at: path, withIntermediateDirectories: true, attributes: nil)
        let pathAppended = path.appendingPathComponent(fileName)
        try data.write(to: pathAppended)
    } catch {
        fatalError("\(error)")
    }
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

/// Write to the file after encoding (see ``#encodeJson()``)
///
/// - Parameter data: The result of ``#encodeJson()``
/// - Parameter fileName: Name of the file
/// - Parameter appendingPath: Path of the directory in which the file should be written to
/// - Returns: Void

private func writeJson(_ data: Data, fileName: String, appendingPath: String? = nil) {
    let docPath = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first
    let path = docPath?.appendingPathComponent(appendingPath ?? "")
    guard let file = path?.appendingPathComponent(fileName) else {
        fatalError("Could not find \(fileName) in documents folder.")
    }
    do {
        try data.write(to: file)
    } catch {
        fatalError("\(error)")
    }
}

/// Reload (encode, write, and decode) any JSON file and type.
///
/// - Parameter value: Codable type, like ``Course``
/// - Parameter fileName: Name of the file
/// - Parameter appendingPath: Path of the directory in which the file should be encoded and written to, and decoded from
/// - Returns: Void

func reloadJson<T: Encodable>(_ value: T, _ fileName: String, appendingPath: String? = nil) {
    let encoded = encodeJson(value)
    writeJson(encoded, fileName: fileName, appendingPath: appendingPath)
    // This is hard-coded because there is no great way to make this a generic
    if (type(of: value) == [Course].self) {
        Model().courses = decodeJson(fileName)
    } else {
        fatalError("Value is not of Course type.")
    }
}
