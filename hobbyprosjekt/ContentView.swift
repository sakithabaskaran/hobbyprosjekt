//
//  ContentView.swift
//  hobbyprosjekt
//
//  Created by Sakitha Baskaran on 17/07/2024.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    @StateObject var countriesViewModel = CountriesViewModel()
    
    var body: some View {
        NavigationView {
            List {
                ForEach(countriesViewModel.countries, id: \.self) { country in
                    HStack {
                        Text(country.name.common)
                        Text(country.flag)
                    }
                    .padding(3)
                }
            }
            .navigationTitle("Countries")
            .onAppear {
                countriesViewModel.getData()
            }
        }
    }
}

#Preview {
    ContentView()
}
