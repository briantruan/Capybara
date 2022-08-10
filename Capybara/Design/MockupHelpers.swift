//
//  MockupHelpers.swift
//  Capybara
//
//  Created by Brian Ruan on 8/10/22.
//

import Foundation
import SwiftUI

func mockCircleButton(_ systemName: String) -> some View {
    return Button {} label: { Image(systemName: systemName) }
        .buttonStyle(.borderless)
}

func mockGauge(_ desc: String, displayedTime: String, progress: Float) -> some View {
    return HStack {
        ZStack {
            ProgressView(value: progress)
                .tint(.orange)
                .progressViewStyle(.circular)
            Text(displayedTime)
                .font(.system(size: 8))
                .fontWeight(.thin)
                .foregroundColor(.white)
        }
        Spacer().frame(width: 20)
        Text(desc)
    }
    .frame(maxWidth: .infinity, alignment: .leading)
}

func mockActivity() -> some View {
    return HStack {
        mockCircleButton("pencil.circle")
            .tint(.orange)
        let difference = (Date.now.timeIntervalSinceReferenceDate/60 - Date(timeIntervalSinceNow: -3000).timeIntervalSinceReferenceDate/60)
        Text("Lecture - \(Int(difference.rounded()))m")
        Text("Start: \(Date(timeIntervalSinceNow: -3000).formatted())")
            .italic()
            .foregroundColor(.secondary)
        Text("End: \(Date.now.formatted())")
            .italic()
            .foregroundColor(.secondary)
    }
    .frame(maxWidth: .infinity, alignment: .leading)
}
