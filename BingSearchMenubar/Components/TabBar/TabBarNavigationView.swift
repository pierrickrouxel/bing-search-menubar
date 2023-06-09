//
//  TabBarNavigationView.swift
//  BingSearchMenubar
//
//  Created by Pierrick ROUXEL on 16/04/2023.
//

import SwiftUI

struct TabBarNavigationView: View {
    @Environment(\.colorScheme) var colorScheme
    let darkColor = Color(red: 0.25, green: 0.25, blue: 0.25, opacity: 1.00)
    
    let tabs: [TabBarItem]
    @Binding  var selection: TabBarItem
    @Namespace private var namespace
    @State var localSelection: TabBarItem
    
    var body: some View {
        tabBar
            .onChange(of: selection) { newValue in
                withAnimation(.easeInOut) {
                    localSelection = newValue
                }
            }
    }
}

struct TabBarNavigationView_Previews: PreviewProvider {
    static let tabs: [TabBarItem] = [
        .chat, .compose
    ]
    
    static var previews: some View {
        TabBarNavigationView(tabs: tabs, selection: .constant(tabs.first!), localSelection: tabs.first!)
            .environment(\.colorScheme, .light)
        TabBarNavigationView(tabs: tabs, selection: .constant(tabs.first!), localSelection: tabs.first!)
            .environment(\.colorScheme, .dark)
            .previewDisplayName("Dark Mode")
    }
}

extension TabBarNavigationView {
    private func tabView(tab: TabBarItem) -> some View {
        VStack {
            Image(systemName: tab.iconName)
                .font(.subheadline)
            Text(tab.title)
                .font(.system(size: 10, weight: .semibold, design: .rounded))
        }
        .foregroundColor(localSelection == tab ? tab.color : .secondary)
        .padding(.vertical, 8)
        .frame(maxWidth: .infinity)
        .background(
            ZStack {
                if localSelection == tab {
                    RoundedRectangle(cornerRadius: 10)
                        .fill(tab.color.opacity(0.2))
                        .matchedGeometryEffect(id: "background_rectangle", in: namespace)
                }
            }
        )
        .contentShape(Rectangle())
    }
    
    private var tabBar: some View {
        HStack {
            ForEach(tabs, id: \.self) { tab in
                tabView(tab: tab)
                    .onTapGesture {
                        switchToTab(tab: tab)
                    }
            }
        }
        .padding(6)
        .background(colorScheme == .dark ? darkColor : .white)
        .cornerRadius(10)
        .shadow(color: .black.opacity(0.3), radius: 10, x: 0, y: 5)
        .padding(.horizontal, 80)
    }
    
    private func switchToTab(tab: TabBarItem) {
        selection = tab
    }
}
