//
//  CapybaraApp.swift
//  Capybara
//
//  Created by Brian Ruan on 8/9/22.
//

import SwiftUI

@main
struct CapybaraApp: App {
    
    @ObservedObject private var model = Model()
    
    var body: some Scene {
        WindowGroup {
            LandingView()
                .environmentObject(model)
                .onAppear {
                    NSWindow.allowsAutomaticWindowTabbing = false
                }
        }
    }
}
