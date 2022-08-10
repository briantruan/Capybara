//
//  LandingView.swift
//  Capybara
//
//  Created by Brian Ruan on 8/9/22.
//

import SwiftUI

struct LandingView: View {
    var body: some View {
        VStack {
            Text("Capybara (Mockup)")
                .font(.largeTitle)
                .fontWeight(.bold)
            Text("Course time management app")
                .font(.subheadline)
                .foregroundColor(.secondary)
            Mockup()
        }
        .padding(20)
    }
}

struct LandingView_Previews: PreviewProvider {
    static var previews: some View {
        LandingView()
    }
}
