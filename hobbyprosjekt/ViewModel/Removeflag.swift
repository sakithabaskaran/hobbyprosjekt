//
//  Removeflag.swift
//  hobbyprosjekt
//
//  Created by Bruker on 07/10/2024.
//

import SwiftUI
import Combine

class SettingsViewModel: ObservableObject {
    @Published var showFlags: Bool = true // Variabel for å kontrollere visning av flagg
}
