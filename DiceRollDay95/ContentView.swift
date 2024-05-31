//
//  ContentView.swift
//  DiceRollDay95
//
//  Created by user256510 on 5/12/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            DiceView()
                .tabItem {
                    Label("Dice",systemImage: "dice" )
                }
           
            ResultsView()
                .tabItem {
                    Label("Results", systemImage: "list.bullet")
                }
        }
    }
}

#Preview {
    ContentView()
}
