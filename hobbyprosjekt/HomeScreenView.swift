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
        TabView {
            NavigationView {
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
            .tabItem {
                Label("Home", systemImage: "house")
            }
            ScrapbookView()
                .tabItem {
                    Label("Map", systemImage: "map")
                }
            SettingsView()
                .tabItem {
                    Label("Settings", systemImage: "gear")
                }
        }
    }
}


struct ScrapbookView: View {
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
    
struct SettingsView: View {
    var body: some View {
        NavigationView {
            Text("Settings")
                .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, maxHeight: .infinity)
                .tabItem {
                    Label("Settings", systemImage: "gear")
                }
        }
    }
}


#Preview {
    HomeScreenView()
}
