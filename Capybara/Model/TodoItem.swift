//
//  TodoItem.swift
//  Capybara
//
//  Created by Brian Ruan on 8/11/22.
//

import Foundation

struct TodoItem: Identifiable, Codable {
    // internal
    var id = UUID().uuidString
    
    var task: String
    var notes = ""
    var priority: Priority = .zero
    var url = ""
    // future EventKit integration
//    var reminder: Date
    
    var dateModified = Date.now
    
    var isFlagged = false
}

enum Priority: String, Codable {
    case zero = ""
    case low = "Low"
    case medium = "Medium"
    case high = "High"
}
