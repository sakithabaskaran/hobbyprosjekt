//
//  SettingsViewModel.swift
//  hobbyprosjekt
//
//  Created by Bruker on 07/10/2024.
//

import Foundation
import SwiftUI
import Combine

class SettingsViewModel: ObservableObject {
    @Published var showFlags: Bool = true // Variabel for å kontrollere visning av flagg
    @Published var isDarkMode: Bool = false // Variabel for å kontrollere mørk modus
    @Published var fontSize: CGFloat = 16 // Standard fontstørrelse
    @Published var shareLocation: Bool = false // Variabel for å kontrollere deling av posisjon
    @Published var selectedLanguage: String = "English" // Variabel for å lagre valgt språk

    // List of available languages
    let languages = ["English", "Norsk", "Svenska"] // Legg til flere språk etter behov

    private var cancellables: Set<AnyCancellable> = [] // For Combine
    
    // Språkene du vil støtte
    let availableLanguages = ["en": "English", "no": "Norsk"]
    
    func changeLanguage(to languageCode: String) {
        selectedLanguage = languageCode
        // Informer appen om at den skal oppdatere språket
        UserDefaults.standard.set(languageCode, forKey: "selectedLanguage")
        // Påkall omstart av appen for å se endringer (kan være mer kompleks)
    }
}
