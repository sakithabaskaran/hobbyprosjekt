//
//  WiFi.swift
//  hobbyprosjekt
//
//  Created by Bruker on 07/10/2024.
//

import Foundation
import Network

class WiFiViewModel: ObservableObject {
    @Published var availableNetworks: [String] = []
    
    func fetchAvailableNetworks() {
        let monitor = NWPathMonitor()
        let queue = DispatchQueue.global(qos: .background)

        monitor.pathUpdateHandler = { path in
            if path.status == .satisfied {
                // Network is available
                print("Network available")

                // Fetching networks
                self.availableNetworks = self.getAvailableNetworks()
            } else {
                print("No network available")
            }
        }
        
        monitor.start(queue: queue)
    }
    
    private func getAvailableNetworks() -> [String] {
        // Placeholder for real network fetching logic
        return ["Nettverk 1", "Nettverk 2", "Nettverk 3"] // Dummy data
    }
}
