//
//  hobbyprosjektTests.swift
//  hobbyprosjektTests
//
//  Created by Sakitha Baskaran on 20/10/2024.
//

/*import Testing
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
}*/

import XCTest
@testable import hobbyprosjekt

class CountriesViewModelTests: XCTestCase {
    
    func testFetch() async throws {
        let viewModel = CountriesViewModel()
        let expectation = XCTestExpectation(description: "Fetch countries from API")

        // Kall fetch-funksjonen asynkront
        GetCountriesFromAPI().fetch(countriesViewModel: viewModel)
        
        // Vent til data er lastet og countries blir oppdatert
        DispatchQueue.main.asyncAfter(deadline: .now() + 5) {
            if viewModel.countries.count > 0 {
                expectation.fulfill()  // Oppfyll forventningen når data er lastet inn
            }
        }
        
        // Vent på at forventningen blir oppfylt eller at tiden går ut
        wait(for: [expectation], timeout: 10.0)
        
        // Sjekk at data er lastet
        XCTAssertTrue(viewModel.countries.count > 0, "Expected at least one country after fetching data")
    }
    
    func testGetCountriesFromViewModel() async throws {
            // Opprett et nytt viewModel-objekt
            let viewModel = CountriesViewModel()
            
            // Opprett GetCountriesFromAPI og kall fetch for å hente data
            let countriesAPI = GetCountriesFromAPI()
            countriesAPI.fetch(countriesViewModel: viewModel)
            
            // Opprett en forventning som venter på at asynkron datainnhenting skal bli ferdig
            let expectation = XCTestExpectation(description: "Expect countries to be empty initially")
            
            // Sjekk at countries er tom før fetch() fullfører
            XCTAssertEqual(viewModel.countries.count, 0, "Expected countries to be empty before fetch completes")
            
            // Asynkron venting for å teste tilstanden etter at fetch har hentet data
            DispatchQueue.main.asyncAfter(deadline: .now() + 5) {
                if viewModel.countries.count > 0 {
                    expectation.fulfill()  // Oppfyll forventningen når data er lastet inn
                }
            }
            
            // Vent på at forventningen skal bli oppfylt
            wait(for: [expectation], timeout: 10.0)
            
            // Sjekk at countries nå inneholder data etter at fetch() er fullført
            XCTAssertTrue(viewModel.countries.count > 0, "Expected countries to contain data after fetch completes")
        }
    
    func testGetCountryNorwayFromViewModel() async throws {
            let viewModel = CountriesViewModel()
            let countriesAPI = GetCountriesFromAPI()
            
            // Kall fetch for å hente data
            countriesAPI.fetch(countriesViewModel: viewModel)
            
            // Sjekk at countries er tom før fetch() fullfører
            XCTAssertEqual(viewModel.countries.count, 0, "Expected countries to be empty before fetch completes")
            
            // Opprett en forventning for at fetch skal fullføres
            let expectation = XCTestExpectation(description: "Fetch countries from API")
            
            // Vent litt for å gi fetch tid til å fullføre og fylle viewModel.countries
            DispatchQueue.main.asyncAfter(deadline: .now() + 5) {
                let countryNames = viewModel.countries.map { $0.name.common }
                
                // Verifiser at "Norway" finnes i listen av land
                XCTAssertTrue(countryNames.contains("Norway"), "Expected 'Norway' to be in the country list")
                
                // Fullfør forventningen når data er lastet
                expectation.fulfill()
            }
            
            // Vent på at forventningen blir oppfylt eller at tiden går ut
            wait(for: [expectation], timeout: 10.0)
        }
}

