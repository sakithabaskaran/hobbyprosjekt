//
//  RESTCountries.swift
//  hobbyprosjekt
//
//  Created by Sakitha Baskaran on 24/07/2024.
//

import Foundation

struct GetCountriesFromAPI {
    func fetch(countriesViewModel: CountriesViewModel) {
        let urlString = "https://restcountries.com/v3.1/all"
        
        guard let url = URL(string: urlString) else {
            print("Error: Could not create URL from string.")
            return
        }
        
        let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
            if let error = error {
                print("Error found: \(error.localizedDescription)")
                return
            }
            
            guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 else {
                print("Invalid response!")
                return
            }
            
            guard let data = data else {
                print("No data received")
                return
            }
            
            do {
                print("Vi kom oss hit") // FIXME
                let countries = try JSONDecoder().decode([Country].self, from: data)
                DispatchQueue.main.async {
                    // print("Inni DispatchQueue")
                    countriesViewModel.countries = countries
                }
            } catch {
                print("Decoding error: \(error.localizedDescription)")
            }
        }
        task.resume()
    }
}



