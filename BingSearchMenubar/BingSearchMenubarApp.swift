//
//  BingSearchMenubarApp.swift
//  BingSearchMenubar
//
//  Created by Pierrick ROUXEL on 12/04/2023.
//

import SwiftUI
import KeyboardShortcuts
import MenuBarExtraAccess

@main
struct BingSearchMenubarApp: App {
    @StateObject private var appState = AppState()
    
    var body: some Scene {
        MenuBarExtra("Bing Search", image: "bing.fill") {
            ContentView()
        }
            .menuBarExtraStyle(.window)
            .menuBarExtraAccess(isPresented: $appState.isMenuPresented)
        
    }
}

@MainActor
final class AppState: ObservableObject {
    @Published var isMenuPresented: Bool = true
    
    init() {
        KeyboardShortcuts.onKeyUp(for: .toggleWindow) { [self] in
            isMenuPresented = !isMenuPresented
        }
    }
}

extension KeyboardShortcuts.Name {
    static let toggleWindow = Self("toggleWindow", default: .init(.b, modifiers: [.control, .option]))
}
