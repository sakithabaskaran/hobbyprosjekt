//
//  ContentView.swift
//  hobbyprosjekt
//
//  Created by Sakitha Baskaran on 17/07/2024.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    @State private var countries = [Countries]()
    
    var body: some View {
        NavigationView {
            List(countries) { country in
                Text(country.name.common)
            }
            .navigationTitle("Land")
        }
        .onAppear {
            downloadCountries { countries in
                self.countries = countries
            }
        }
    }
}
