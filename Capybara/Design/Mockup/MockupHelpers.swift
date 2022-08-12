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

func mockMetric(_ desc: String, metric: String, trend: String) -> some View {
    return VStack {
        Group {
            HStack {
                Text(desc)
                    .font(.title2)
                    .fontWeight(.bold)
                    .frame(maxWidth: .infinity, alignment: .leading)
                Image(systemName: "arrow.up.forward.square")
                    .frame(maxWidth: 20, alignment: .trailing)
            }
            Spacer().frame(height: 40)
            HStack {
                Text(metric)
                    .font(.largeTitle)
                    .fontWeight(.heavy)
                    .frame(maxWidth: .infinity, alignment: .leading)
                Image(systemName: trend)
                    .resizable()
                    .frame(maxWidth: 30, maxHeight: 30)
            }
        }
        .frame(maxWidth: .infinity, alignment: .topLeading)
    }
    .frame(maxHeight: 120, alignment: .topLeading)
    .padding()
}

func mockCourseAndGauge(_ desc: String, icon: String,
                        metric: String, progress: Float) -> some View {
    return HStack {
        ZStack {
            gradientRectangle(color1: .purple, color2: .gray,
                              width: 30, height: 30, curveRadius: 10)
            Image(systemName: icon)
                .frame(maxWidth: 25, maxHeight: 25)
        }
        
        Text(desc)
            .fontWeight(.semibold)
            .frame(maxWidth: .infinity, alignment: .leading)
        ZStack {
            gradientRectangle(color1: .purple, color2: .gray,
                              width: 60, height: 30, curveRadius: 10)
            Text(metric)
        }
        ProgressView(value: progress, total: 100)
            .tint(.purple)
    }
}

func mockTodoItem(_ course: String, icon: String, item: String) -> some View {
    return HStack {
        Button {} label: {
            Image(systemName: "checkmark.circle")
        }
        .buttonStyle(.borderless)
        Button {} label: {
            Image(systemName: "info.circle")
        }
        .buttonStyle(.borderless)
        ZStack {
            gradientRectangle(color1: .purple, color2: .gray,
                              width: 30, height: 30, curveRadius: 10)
            Image(systemName: icon)
                .frame(maxWidth: 25, maxHeight: 25)
        }
        Text(course)
            .fontWeight(.semibold)
        Text(item)
            .frame(maxWidth: .infinity, maxHeight: 20, alignment: .leading)
    }
}
