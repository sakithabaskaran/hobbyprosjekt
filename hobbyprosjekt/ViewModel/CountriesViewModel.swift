//
//  CountriesViewModel.swift
//  hobbyprosjekt
//
//  Created by Sakitha Baskaran on 23/08/2024.
//

import Foundation
import SwiftUI

class CountriesViewModel: ObservableObject {
    @Published var countries: [Country] = []
    @Published var searchText: String = ""
    
    let getCountries = GetCountriesFromAPI()
    
    func getData() {
        getCountries.fetch(countriesViewModel: self)
    
    }
    
    var filterCountries: [Country] {
        guard !searchText.isEmpty else { return countries }
        return countries.filter { country in
            country.name.common.lowercased().contains(searchText.lowercased())
        }
    }
    
    /*
    func CountryList() -> [String] {
        var nameList: [String] = []
        countries.forEach { land in
            nameList.append(land.name.common)
            // print(countries)
        }
        print(nameList)
        return nameList
    }*/
    
}
