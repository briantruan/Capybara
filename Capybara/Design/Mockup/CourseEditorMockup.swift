//
//  Mockup.swift
//  Capybara
//
//  Created by Brian Ruan on 8/10/22.
//

import SwiftUI

struct CourseEditorMockup: View {
    
    @State private var icon = 0
    @State private var dummy0 = ""
    @State private var dummy1 = ""
    @State private var dummy2 = ""
    @State private var dummy3 = ""
    
    @State private var isActivated = true
    @State private var isFavorited = false
    
    var body: some View {
        VStack {
            // Course information
            HStack {
                Button {
                    if (icon == iconSet.count - 1) {
                        icon = 0
                    } else {
                        icon += 1
                    }
                } label: {
                    Image(systemName: iconSet[icon])
                        .foregroundColor(.primary)
                }
                .frame(maxWidth: 25, maxHeight: 25)
                .buttonStyle(.borderless)
                TextField("Course Code", text: $dummy0)
                    .textFieldStyle(.plain)
                    .font(.headline)
                    .onAppear {
                        self.dummy0 = "EECS 280"
                    }
                mockToggleButton("checkmark.circle", active: $isActivated, color: .green)
                mockToggleButton("star.circle", active: $isFavorited, color: .yellow)
            }
            TextField("Course Name", text: $dummy1)
                .textFieldStyle(.plain)
                .font(.subheadline)
                .foregroundColor(.secondary)
                .onAppear {
                    self.dummy1 = "Programming and Intro Data Structures"
                }
            HStack {
                TextField("Professor Name", text: $dummy2)
                    .textFieldStyle(.plain)
                    .font(.subheadline)
                    .foregroundColor(.secondary)
                    .onAppear {
                        self.dummy2 = "Professor Juett"
                    }
                TextField("Term", text: $dummy3)
                    .textFieldStyle(.plain)
                    .font(.subheadline)
                    .foregroundColor(.secondary)
                    .onAppear {
                        self.dummy3 = "Fall 2022"
                    }
            }
            Divider()
            
            // Activity overview
            VStack {
                mockGauge("Total Time", displayedTime: "149h", progress: 0.25)
                    .padding(.vertical, 0.0)
                    .frame(maxWidth: .infinity, alignment: .leading)
                HStack {
                    VStack {
                        mockGauge("Lecture", displayedTime: "50m", progress: 0.10)
                        mockGauge("Lab", displayedTime: "30m", progress: 0.05)
                        mockGauge("Assessments", displayedTime: "3h", progress: 0.25)
                    }
                    VStack {
                        mockGauge("Discussion", displayedTime: "50m", progress: 0.10)
                        mockGauge("Homework", displayedTime: "9h", progress: 0.30)
                        mockGauge("Studying", displayedTime: "15h", progress: 0.45)
                    }
                    VStack {
                        mockGauge("Recitation", displayedTime: "0m", progress: 0)
                        mockGauge("Projects", displayedTime: "30h", progress: 0.95)
                        mockGauge("Other", displayedTime: "0m", progress: 0)
                    }
                }
            }
            
            Divider()
            
            // List of activities
            List {
                ForEach(0..<10) { _ in
                    mockActivity()
                }
            }
            .offset(x: -12, y: -8)
            HStack {
                Button {} label: {
                    Image(systemName: "plus.circle")
                    Text("Add an activity")
                }
                .buttonStyle(.borderless)
            }
        }
        .padding(20)
    }
}

struct CourseEditorMockup_Previews: PreviewProvider {
    static var previews: some View {
        CourseEditorMockup()
    }
}
