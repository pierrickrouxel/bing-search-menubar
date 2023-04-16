//
//  ContentView.swift
//  BingSearchMenuBar
//
//  Created by Pierrick ROUXEL on 12/04/2023.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack(alignment: .top) {
            TabbedView()
            
            ConfigMenuView()
                .frame(height: 70)
                .frame(maxWidth: .infinity, alignment: .trailing)
                .padding(.trailing, 15)
            
            Image("bing")
                .resizable()
                .frame(width: 40, height: 40)
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(15)
        }
        .frame(minWidth: 400, maxWidth: 400, minHeight: 600)
        .background(Color(red: 0.95, green: 0.95, blue: 0.95, opacity: 1.00))
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
