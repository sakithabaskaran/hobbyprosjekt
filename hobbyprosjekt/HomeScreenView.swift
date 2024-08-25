//
//  ContentView.swift
//  hobbyprosjekt
//
//  Created by Sakitha Baskaran on 17/07/2024.
//

import SwiftUI
import SwiftData

struct HomeScreenView: View {
    @StateObject var countriesViewModel = CountriesViewModel()
    
    var body: some View {
        NavigationView {
            TabView {
                Text("Home Screen")
                    .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, maxHeight: .infinity)
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
            List {
                ForEach(countriesViewModel.filterCountries, id: \.self) { country in
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
            .searchable(text: $countriesViewModel.searchText)
        }
    }
}

#Preview {
    HomeScreenView()
}
