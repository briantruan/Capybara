//
//  CourseEditorMockup.swift
//  Capybara
//
//  Created by Brian Ruan on 8/10/22.
//

import SwiftUI

struct CourseEditorMockup: View {
    var body: some View {
        VStack {
            HStack {
                header("Course Editor", icon: Image(systemName: "text.book.closed"))
                mockCircleButton("tray.circle")
                    .tint(.green)
                Text("Save")
                mockCircleButton("minus.circle")
                    .tint(.yellow)
                Text("Cancel")
            }
            
            Divider()
            
            
        }
        .padding(20)
    }
}

struct CourseEditorMockup_Previews: PreviewProvider {
    static var previews: some View {
        CourseEditorMockup()
    }
}
