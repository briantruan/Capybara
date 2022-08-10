//
//  ViewHelpers.swift
//  Capybara
//
//  Created by Brian Ruan on 8/10/22.
//

import Foundation
import SwiftUI

func header(_ desc: String, icon: Image?, isSubheader: Bool = false) -> some View {
    return HStack {
        if let icon = icon {
            icon
        }
        Text(desc)
            .font(isSubheader ? .subheadline : .headline)
            .fontWeight(isSubheader ? .thin : .heavy)
    }
    .frame(maxWidth: .infinity, alignment: .leading)
}
