//
//  TabBarView.swift
//  BingSearchMenubar
//
//  Created by Pierrick ROUXEL on 16/04/2023.
//

import SwiftUI

struct TabBarView<Content:View>: View {
    
    @Binding var selection: TabBarItem
    let content: Content
    @State private var tabs: [TabBarItem] = []
    
    init(selection: Binding<TabBarItem>, @ViewBuilder content: () -> Content) {
        self._selection = selection
        self.content = content()
    }
    
    var body: some View {
        ZStack() {
            ZStack(alignment: .top) {
                content
                    .padding(.top, 70)
                
                TabBarNavigationView(tabs: tabs, selection: $selection, localSelection: selection)
                    .padding(.top, 8)
            }
        }
        .onPreferenceChange(TabBarItemsPreferenceKey.self) { value in
            self.tabs = value
        }
    }
}

struct TabBarView_Previews: PreviewProvider {
    
    static let tabs: [TabBarItem] = [
        .chat, .compose
    ]
    
    static var previews: some View {
        TabBarView(selection: .constant(tabs.first!)) {
            Color.red
                .tabBarItem(tab: .chat, selection: .constant(.chat))
                
        }
    }
}
