//
//  SettingsView.swift
//  hobbyprosjekt
//
//  Created by Sakitha Baskaran on 05/09/2024.
//

import SwiftUI
import UIKit
import SwiftData

struct SettingsView: View {
    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("General")) {
                    Label("About", systemImage: "info.circle")
                    Label("Wi-Fi", systemImage: "wifi")
                }
                
                Section(header: Text("Display")) {
                    Toggle(isOn: /*@START_MENU_TOKEN@*/.constant(true)/*@END_MENU_TOKEN@*/, label: {
                        Text("Dark Mode")
                    })
                    Toggle(isOn: /*@START_MENU_TOKEN@*/.constant(true)/*@END_MENU_TOKEN@*/, label: {
                        Text("Remove flags")
                    })
                    Text("Change languages")
                    Text("Font sizing")
                }
                
                Section(header: Text("Notifications"),
                        footer: Text("With shared location, you can get personalized notifications based on your position.")) {
                    Toggle(isOn: /*@START_MENU_TOKEN@*/.constant(true)/*@END_MENU_TOKEN@*/, label: {
                        Text("Share location")
                    })
                }
            }
            .navigationTitle("Settings")
        }
        
    }
}

#Preview {
    SettingsView()
}
