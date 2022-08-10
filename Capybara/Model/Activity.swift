//
//  Activity.swift
//  Capybara
//
//  Created by Brian Ruan on 8/9/22.
//

import Foundation

struct Activity: Identifiable, Codable {
    // internal
    var id = UUID().uuidString
    
    var activityType: ActivityType
    var timeStart: Date
    var timeEnd: Date
    var comments = ""
    var dateModified: Date = Date.now
}

enum ActivityType: String, Codable {
    case lecture = "Lecture"
    case discussion = "Discussion"
    case recitation = "Recitation"
    case lab = "Lab"
    case homework = "Homework"
    case projects = "Projects"
    case assessments = "Assessments"
    case studying = "Studying"
    case other = "Other"
}
