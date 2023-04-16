//
//  AppBarTabView.swift
//  BingSearchMenubar
//
//  Created by Pierrick ROUXEL on 16/04/2023.
//

import SwiftUI

extension TabBarItem {
    static let chat = Self("Chat", iconName: "text.bubble", color: .blue)
    static let compose = Self("Compose", iconName: "doc.plaintext", color: .blue)
}

struct TabbedView: View {
    @State private var tabSelection: TabBarItem = .chat
    
    var body: some View {
        TabBarView(selection: $tabSelection) {
            BingWebView(.chat)
                .tabBarItem(tab: .chat, selection: $tabSelection)
            
            BingWebView(.compose)
                .tabBarItem(tab: .compose, selection: $tabSelection)
        }
    }
}

struct TabbedView_Previews: PreviewProvider {
    static var previews: some View {
        TabbedView()
    }
}
