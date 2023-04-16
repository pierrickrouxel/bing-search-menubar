//
//  TabBarItem.swift
//  BingSearchMenubar
//
//  Created by Pierrick ROUXEL on 16/04/2023.
//

import SwiftUI

struct TabBarItem: Hashable {
    let title: String
    let iconName: String
    let color: Color
    
    init(_ title: String, iconName: String, color: Color) {
        self.title = title
        self.iconName = iconName
        self.color = color
    }
}

