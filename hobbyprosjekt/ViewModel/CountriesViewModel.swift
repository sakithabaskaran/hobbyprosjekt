//
//  CountriesViewModel.swift
//  hobbyprosjekt
//
//  Created by Sakitha Baskaran on 23/08/2024.
//

import Foundation

class CountriesViewModel: ObservableObject {
    @Published var countries: [Country] = []
    
    func getData() {
        fetch(countriesViewModel: self)
    }
}
