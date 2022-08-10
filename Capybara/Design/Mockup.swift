//
//  Mockup.swift
//  Capybara
//
//  Created by Brian Ruan on 8/10/22.
//

import SwiftUI

struct Mockup: View {
    var body: some View {
        VStack {
            // Course information
            HStack {
                header("EECS 280", icon: Image(systemName: "laptopcomputer"))
                // isActivated
                mockCircleButton("checkmark.circle.fill")
                    .tint(.green)
                // isFavorited
                mockCircleButton("star.circle")
                    .tint(.white)
                // edit information
                mockCircleButton("pencil.circle")
                    .tint(.orange)
            }
            header("Programming and Intro Data Structures", icon: nil, isSubheader: true)
            header("Professor Juett - Fall 2022", icon: nil, isSubheader: true)
            
            Divider()
            
            // Activity overview
            VStack {
                mockGauge("Total Time", displayedTime: "149h", progress: 0.25)
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
            ScrollView {
                LazyVStack {
                    ForEach(0..<10) { _ in
                        mockActivity()
                    }
                }
            }
        }
        .padding(20)
    }
}

struct Mockup_Previews: PreviewProvider {
    static var previews: some View {
        Mockup()
    }
}
