import SwiftUI

struct SettingsView: View {
    @ObservedObject var settingsViewModel: SettingsViewModel // Mottar ViewModel

    // Definerer tilgjengelige fontstørrelser
    let fontSizes: [CGFloat] = [10, 14, 16, 18, 22] // Bare 5 ulike verdier

    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("General")) {
                    NavigationLink(destination: AboutView()) {
                        Label("About", systemImage: "info.circle")
                    }
                    NavigationLink(destination: WiFiView()) {
                        Label("Wi-Fi", systemImage: "wifi")
                    }
                }
                
                Section(header: Text("Display")) {
                    Toggle(isOn: $settingsViewModel.showFlags) {
                        Text("Remove flags")
                    }
                    Toggle(isOn: $settingsViewModel.isDarkMode) {
                        Text("Dark Mode")
                    }
                    Picker("Change Language", selection: $settingsViewModel.selectedLanguage) {
                        ForEach(settingsViewModel.languages, id: \.self) { language in
                            Text(language).tag(language)
                        }
                    }
                    
                    Text("Font Size: \(Int(settingsViewModel.fontSize))") // Visning av nåværende fontstørrelse

                    // Slider for å justere fontstørrelse
                    Slider(value: Binding(
                        get: {
                            // Hent fontstørrelsen fra fontSizes-arrayet
                            return settingsViewModel.fontSize
                        },
                        set: { newValue in
                            // Finn den nærmeste verdien i fontSizes-arrayet
                            settingsViewModel.fontSize = fontSizes.min(by: { abs($0 - newValue) < abs($1 - newValue) }) ?? 16
                        }
                    ), in: 10...22, step: 1)
                }

                Section(header: Text("Notifications"),
                        footer: Text("With shared location, you can get personalized notifications based on your position.")) {
                    Toggle(isOn: $settingsViewModel.shareLocation) { // Toggle for å dele posisjon
                        Text("Share location")
                    }
                }
            }
            .navigationTitle("Settings")
            .onAppear {
                // Sett standard fontstørrelse til 16
                settingsViewModel.fontSize = 16
            }
        }
    }
}

#Preview {
    SettingsView(settingsViewModel: SettingsViewModel()) // Passer ViewModel til preview
}
