//
//  ScrapbookView.swift
//  hobbyprosjekt
//
//  Created by Sakitha Baskaran on 05/09/2024.
//

import SwiftUI
import UIKit
import SwiftData

struct ScrapbookView: View {
    @EnvironmentObject var settingsViewModel: SettingsViewModel // Henter miljøobjektet
    
    var body: some View {
        NavigationView {
            Text("Scrapbook")
                .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, maxHeight: .infinity)
                .tabItem {
                    Label("Map", systemImage: "map")
                }
        }
    }
}
#Preview {
    ScrapbookView()
}

