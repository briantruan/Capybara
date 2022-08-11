//
//  ViewHelpers.swift
//  Capybara
//
//  Created by Brian Ruan on 8/10/22.
//

import Foundation
import SwiftUI

/// Create a quick header at the top of any view
///
/// - Parameter desc: Description of the view
/// - Parameter icon: Icon that precedes the description
/// - Parameter isSubheader: Set as a subheader. Default = false
/// - Returns: Header as an HStack

func header(_ desc: String, icon: Image?, isSubheader: Bool = false) -> some View {
    return HStack {
        if let icon = icon {
            icon
        }
        Text(desc)
            .font(isSubheader ? .subheadline : .headline)
            .fontWeight(isSubheader ? .thin : .heavy)
            .textSelection(.enabled)
    }
    .frame(maxWidth: .infinity, alignment: .leading)
}

/// Create a sidebar menu item header
///
/// - Parameter desc: Name of the header
/// - Returns: Header as Text
func sidebarHeader(_ desc: String) -> some View {
    return Text(desc)
        .font(.subheadline)
        .fontWeight(.bold)
        .foregroundColor(.secondary)
}

/// Create a sidebar menu item under a list in a NavigationView
///
/// - Parameter desc: Description of the item. This will also be the navigation title\
/// - Parameter icon: Icon that precedes the description
/// - Parameter destination: Where the sidebar item should go
/// - Returns: NavigationLink

func sidebarMenuItem(_ desc: String, icon: Image, destination: AnyView) -> some View {
    return NavigationLink {
        destination
    } label: {
        icon.frame(maxWidth: 25, maxHeight: 25)
        Text(desc)
            .navigationTitle(desc)
    }
}

/// Creates a button that can iterate through the set of icons defined in ``iconSet``
///
/// - Parameter icon: A binding for that specific view as an Int
/// - Returns: Button that can iterate through all icons in ``iconSet``

func courseIconIterator(_ icon: Binding<Int>) -> some View {
    Button {
        if (icon.wrappedValue == iconSet.count - 1) {
            icon.wrappedValue = 0
        } else {
            icon.wrappedValue += 1
        }
    } label: {
        Image(systemName: iconSet[icon.wrappedValue])
            .foregroundColor(.primary)
    }
    .frame(maxWidth: 25, maxHeight: 25)
    .buttonStyle(.borderless)
}
