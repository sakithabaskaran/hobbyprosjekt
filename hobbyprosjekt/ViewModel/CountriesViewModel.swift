//
//  CountriesViewModel.swift
//  hobbyprosjekt
//
//  Created by Sakitha Baskaran on 23/08/2024.
//

import Foundation
import SwiftUI

class CountriesViewModel: ObservableObject {
    //Denne inneholder dataene om de ulike landene
    @Published var countries: [Country] = []
    //En streng som holder på teksten som brukeren skriver inn for å søke etter spesifikke land
    @Published var searchText: String = ""
    
    func getData() {
        fetch(countriesViewModel: self)
    
    }
    //søke paa land, dersom det ikke søkes noe, dukker alle land opp
    var filterCountries: [Country] {
        guard !searchText.isEmpty else { return countries }
        return countries.filter { country in
            country.name.common.lowercased().contains(searchText.lowercased())
        }
    }
    //legger til i en liste over navnene til landene
    func CountryList() -> [String] {
        var nameList: [String] = []
        countries.forEach { land in
            nameList.append(land.name.common)
        }
        return nameList
    }
    
}
