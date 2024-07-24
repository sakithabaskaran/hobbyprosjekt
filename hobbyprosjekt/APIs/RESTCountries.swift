//
//  RESTCountries.swift
//  hobbyprosjekt
//
//  Created by Sakitha Baskaran on 24/07/2024.
//

import Foundation

func fetchData() async {
    // oppretter URL-en
    guard let url = URL(string: Constants.fullURL) else {
        print("Denne URL-en er ikke tilgjengelig!")
        return
    }
    
    // fetch data fra lenken
    /*
    do {
        let (data, _) = try await URLSession.shared.data(from: url)
        
        if let decodedResponse = try? JSONDecoder().decode(type: Decodable.Protocol, from: Data)
    } catch {
        print("Snatchet før du fetchet")
    }*/
}
