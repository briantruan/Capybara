//
//  Course.swift
//  Capybara
//
//  Created by Brian Ruan on 8/9/22.
//

import Foundation

struct Course: Identifiable, Codable {
    // internal
    var id = UUID().uuidString
    
    var icon: Int
    var code: String
    var name: String
    var instructor = ""
    var term = ""
    
    var activities: [Activity] = []
    var todo: [TodoItem] = []
    // notes manager
//    var notes: [Note] = []
    
    var comments = ""
    var dateModified = Date.now
    
    var isActivated = true
    var isFavorited = false
}
