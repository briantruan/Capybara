//
//  SidebarView.swift
//  Capybara
//
//  Created by Brian Ruan on 8/10/22.
//

import SwiftUI

struct SidebarView: View {
    var body: some View {
        List {
            Group {
                sidebarHeader("Actions")
                sidebarMenuItem("Courses", icon: Image(systemName: "book"),
                                destination: AnyView(CourseView()))
                sidebarMenuItem("Activities", icon: Image(systemName: "pencil"),
                                destination: AnyView(ActivityView()))
                sidebarMenuItem("Todo", icon: Image(systemName: "list.bullet"),
                                destination: AnyView(TodoListView()))
            }
            Group {
                sidebarHeader("Recent Courses")
            }
            Group {
                sidebarHeader("Account")
                sidebarMenuItem("Profile", icon: Image(systemName: "person.circle"),
                                destination: AnyView(PreferencesView()))
            }
            // dev
            Group {
                sidebarHeader("Developer")
                sidebarMenuItem("Mockup", icon: Image(systemName: "eyeglasses"),
                                destination: AnyView(CourseEditorMockup()))
            }
        }
        .listStyle(.sidebar)
        .toolbar {
            ToolbarItem(placement: .navigation) {
                Button {
                    // https://sarunw.com/posts/how-to-toggle-sidebar-in-macos/
                    NSApp.keyWindow?.firstResponder?
                        .tryToPerform(#selector(NSSplitViewController.toggleSidebar(_:)), with: nil)
                } label: {
                    Image(systemName: "sidebar.leading")
                }
            }
        }
    }
}

struct SidebarView_Previews: PreviewProvider {
    static var previews: some View {
        SidebarView()
    }
}
