//
//  LandingView.swift
//  Capybara
//
//  Created by Brian Ruan on 8/9/22.
//

import SwiftUI

struct LandingView: View {
    
    @EnvironmentObject private var model: Model
    
    var body: some View {
        NavigationView {
            SidebarView()
                .environmentObject(Model())
            showLanding()
        }
    }
}

struct LandingView_Previews: PreviewProvider {
    static var previews: some View {
        LandingView()
            .environmentObject(Model())
    }
}

func showLanding() -> some View {
    return VStack {
        Text("Capybara")
            .font(.largeTitle)
            .fontWeight(.bold)
        Text("Course time management app")
            .font(.subheadline)
            .foregroundColor(.secondary)
    }
    .padding(20)
    .frame(minWidth: 600, minHeight: 400)
}
