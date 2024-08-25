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
    //@StateObject var listOfCountries = self.CountryList()
    
    var body: some View {
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
    }
}

#Preview {
    HomeScreenView()
}
