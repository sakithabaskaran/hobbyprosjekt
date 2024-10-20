//
//  hobbyprosjektTests.swift
//  hobbyprosjektTests
//
//  Created by Sakitha Baskaran on 20/10/2024.
//

import Testing
@testable import hobbyprosjekt

struct hobbyprosjektTests {
    
    // FIXME: Legg til tags!!
    struct RESTCountriesAPITests {
        @Test
        func testFetch() async throws {
            let viewModel = CountriesViewModel()
            viewModel.getData()
            // #expect(viewModel.countries.count > 0)
            let counter = viewModel.filterCountries.count
            #expect(counter > 0)
        }
        
        @Test
        func getCountriesFromViewModel() async throws {
            let viewModel = CountriesViewModel()
            let countries = GetCountriesFromAPI()
            countries.fetch(countriesViewModel: viewModel)
            #expect(viewModel.countries.count == 0)
        }
        
        @Test
        func getCountryNorwayFromViewModel() async throws {
            let viewModel = CountriesViewModel()
            let countries = GetCountriesFromAPI()
            countries.fetch(countriesViewModel: viewModel)
            let countryNames = viewModel.countries.map(\.self.name.common)
            #expect(countryNames.contains("Norway"))
        }
    }
}
