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

func mockToggleButton(_ systemName: String, active: Binding<Bool>, color: Color) -> some View {
    return HStack {
        Button {
            active.wrappedValue = !active.wrappedValue
        } label: {
            Image(systemName: "\(systemName)\(active.wrappedValue ? ".fill" : "")")
        }
        .tint(active.wrappedValue ? color : .primary)
        .buttonStyle(.borderless)
    }
}

func mockGauge(_ desc: String, displayedTime: String, progress: Float) -> some View {
    return HStack {
        ZStack {
            ProgressView(value: progress)
                .tint(.green)
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
            .tint(.green)
        let difference = (Date.now.timeIntervalSinceReferenceDate/60 - Date(timeIntervalSinceNow: -3000).timeIntervalSinceReferenceDate/60)
        Text("\(Int(difference.rounded()))m Lecture:")
        Text("started at \(Date(timeIntervalSinceNow: -3000).formatted()),")
            .italic()
            .foregroundColor(.secondary)
        Text("ended at \(Date.now.formatted())")
            .italic()
            .foregroundColor(.secondary)
    }
    .frame(maxWidth: .infinity, alignment: .leading)
}

func mockTextField(_ desc: String, text: String,
                   binding: Binding<String>, width: CGFloat = .infinity) -> some View {
    return VStack {
        TextField(text, text: binding)
            .frame(maxWidth: width)
        Text(desc)
            .italic()
            .font(.system(size: 8))
            .offset(x: 2, y: -4)
            .frame(maxWidth: width, alignment: .leading)
    }
    .frame(maxWidth: width, alignment: .leading)
}
