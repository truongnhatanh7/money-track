//
//  ContentView.swift
//  money-track
//
//  Created by Truong Nhat Anh on 25/06/2022.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            Home()
                .tabItem {
                    Label("Home", systemImage: "house")
                }
            History()
                .tabItem {
                    Label("History", systemImage: "tray")
                }
        }
            
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
