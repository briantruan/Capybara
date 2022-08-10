//
//  ActivityEditorMockup.swift
//  Capybara
//
//  Created by Brian Ruan on 8/10/22.
//

import SwiftUI

struct ActivityEditorMockup: View {
    var body: some View {
        VStack {
            HStack {
                header("Activity Editor", icon: Image(systemName: "textformat.abc.dottedunderline"))
                mockCircleButton("tray.circle")
                    .tint(.green)
                mockCircleButton("minus.circle")
                    .tint(.yellow)
            }
            
            Divider()
            
            
        }
        .padding(20)
    }
}

struct ActivityEditorMockup_Previews: PreviewProvider {
    static var previews: some View {
        ActivityEditorMockup()
    }
}
