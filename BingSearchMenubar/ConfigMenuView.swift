//
//  ConfigMenuView.swift
//  BingSearchMenubar
//
//  Created by Pierrick ROUXEL on 15/04/2023.
//

import SwiftUI

struct ConfigMenuView: View {
    var body: some View {
        Menu(content: {
            Text("Keyboard shortcut: ⌃ ⌥ B")
            Button("Quit") {
                NSApplication.shared.terminate(nil)
            }
        }, label: {
            Image(systemName: "gear").resizable().scaleEffect(3.0)
        })
        .fixedSize()
        .menuStyle(.borderlessButton)
        .menuIndicator(.hidden)
    }
}

struct ConfigView_Previews: PreviewProvider {
    static var previews: some View {
        ConfigMenuView()
    }
}
