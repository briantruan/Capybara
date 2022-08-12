//
//  FigmaMockup.swift
//  Capybara
//
//  Created by Brian Ruan on 8/11/22.
//

import SwiftUI

struct FigmaMockup: View {
    
    let date = Date()
    let dateFormatter = DateFormatter()
    
    init() {
        dateFormatter.locale = Locale(identifier: "en-US")
        dateFormatter.setLocalizedDateFormatFromTemplate("EEE MMM d")
    }
    
    var body: some View {
        VStack {
            HStack {
                Button {} label: {
                    Image(systemName: "sidebar.leading")
                }
                .buttonStyle(.borderless)
                .foregroundColor(.primary)
                
                header("Dashboard", icon: nil)
                
                Button {} label: {
                    Image(systemName: "bell.fill")
                }
                .buttonStyle(.borderless)
                .foregroundColor(.primary)
                
                Button {} label: {
                    Image(systemName: "person.circle")
                }
                .buttonStyle(.borderless)
                .foregroundColor(.primary)
            }
            
            Spacer().frame(height: 20)
            
            Group {
                Text("Today")
                    .font(.largeTitle)
                    .fontWeight(.heavy)
                Spacer().frame(height: 5)
                Text("\(date, formatter: dateFormatter) | \(date, style: .time)")
                    .font(.title2)
                    .fontWeight(.semibold)
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            
            Spacer().frame(height: 20)
            
            HStack {
                ZStack {
                    gradientRectangle(color1: Color("Emerald"), color2: .gray,
                                      width: .infinity, height: 150, curveRadius: 10)
                    mockMetric("YTD - 2022", metric: "2048h", trend: "arrow.up.right")
                }
                Spacer().frame(width: 20)
                ZStack {
                    gradientRectangle(color1: Color("Emerald"), color2: .gray,
                                      width: .infinity, height: 150, curveRadius: 10)
                    mockMetric("Weekly Activity", metric: "40h30m", trend: "arrow.down")
                    
                }
                Spacer().frame(width: 20)
                ZStack {
                    gradientRectangle(color1: Color("Emerald"), color2: .gray,
                                      width: .infinity, height: 150, curveRadius: 10)
                    mockMetric("Todo Items", metric: "15", trend: "")
                }
            }
            
            Spacer().frame(height: 20)
            
            HStack {
                ZStack {
                    gradientRectangle(color1: Color("Emerald"), color2: .gray,
                                      width: .infinity, height: 250, curveRadius: 10)
                    VStack {
                        Group {
                            HStack {
                                Text("Active Courses")
                                    .font(.title2)
                                    .fontWeight(.bold)
                                    .frame(maxWidth: .infinity, alignment: .leading)
                            }
                            Spacer().frame(height: 40)
                            ScrollView {
                                LazyVStack {
                                    mockCourseAndGauge("EECS 281", icon: "laptopcomputer",
                                                       metric: "160h", progress: 20)
                                    mockCourseAndGauge("EECS 370", icon: "function",
                                                       metric: "400h", progress: 50)
                                    mockCourseAndGauge("EECS 376", icon: "cpu",
                                                       metric: "200h", progress: 25)
                                    mockCourseAndGauge("ECON 102", icon: "dollarsign.square",
                                                       metric: "40h", progress: 5)
                                }
                            }
                        }
                        .frame(maxWidth: .infinity, alignment: .topLeading)
                    }
                    .frame(maxHeight: 220, alignment: .topLeading)
                    .padding()
                }
                Spacer().frame(width: 20)
                ZStack {
                    gradientRectangle(color1: Color("Emerald"), color2: .gray,
                                      width: .infinity, height: 250, curveRadius: 10)
                    VStack {
                        Group {
                            HStack {
                                Text("Todo List")
                                    .font(.title2)
                                    .fontWeight(.bold)
                                    .frame(maxWidth: .infinity, alignment: .leading)
                            }
                            Spacer().frame(height: 40)
                            ScrollView {
                                LazyVStack {
                                    mockTodoItem("EECS 281", icon: "laptopcomputer",
                                                 item: "Finish writing unit tests")
                                    mockTodoItem("EECS 370", icon: "function",
                                                 item: "Text partners and see why they're " +
                                                 "taking so long")
                                    mockTodoItem("ECON 102", icon: "dollarsign.square",
                                                 item: "Perusall reading")
                                }
                            }
                        }
                        .frame(maxWidth: .infinity, alignment: .topLeading)
                    }
                    .frame(maxHeight: 220, alignment: .topLeading)
                    .padding()
                }
            }
        }
        .padding()
    }
    
}

struct FigmaMockup_Previews: PreviewProvider {
    static var previews: some View {
        FigmaMockup()
            .frame(minWidth: 900, minHeight: 550)
    }
}
