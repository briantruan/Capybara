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
    
    var code: String
    var name: String
    var instructor = ""
    var term = ""
    
}
