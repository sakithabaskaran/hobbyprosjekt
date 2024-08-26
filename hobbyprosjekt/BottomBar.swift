//
//  BottomBar.swift
//  hobbyprosjekt
//
//  Created by Sakitha Baskaran on 25/08/2024.
//

import Foundation
import SwiftUI

struct BottombarView: View {
    var body: some View {
        
        NavigationView{
            TabView {
                HomeScreenView()
                    .tabItem {
                        Label("Home", systemImage: "house")
                    }
                Text("Scrapbook")
                    .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, maxHeight: .infinity)
                    .tabItem {
                        Label("Map", systemImage: "map")
                    }
                Text("Settings")
                    .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, maxHeight: .infinity)
                    .tabItem {
                        Label("Settings", systemImage: "gear")
                    }
            }
        }
    }
}

#Preview {
    BottombarView()
}
