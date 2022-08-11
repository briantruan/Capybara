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
            Text("Real Capy")
                .font(.largeTitle)
                .fontWeight(.bold)
            Text("Real")
                .font(.subheadline)
                .foregroundColor(.secondary)
            CourseEditorMockup()
        }
        .padding(20)
    }
}

struct LandingView_Previews: PreviewProvider {
    static var previews: some View {
        LandingView()
    }
}
