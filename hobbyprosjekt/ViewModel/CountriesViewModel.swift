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
    
    func getData() {
        fetch(countriesViewModel: self)
    
    }
    
    var filterCountries: [Country] {
        guard !searchText.isEmpty else { return countries }
        return countries.filter { country in
            country.name.common.lowercased().contains(searchText.lowercased())
        }
    }
     
    func CountryList() -> [String] {
        var nameList: [String] = []
        countries.forEach { land in
            nameList.append(land.name.common)
        }
        return nameList
    }
    
}
