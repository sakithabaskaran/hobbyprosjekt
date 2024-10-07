import SwiftUI

struct SettingsView: View {
    @ObservedObject var settingsViewModel: SettingsViewModel // Mottar ViewModel

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
                    Text("Change languages")
                    Picker("Select Language", selection: $settingsViewModel.selectedLanguage) {
                        ForEach(settingsViewModel.languages, id: \.self) { language in
                            Text(language).tag(language)
                        }
                    }
                    Text("Font Size: \(Int(settingsViewModel.fontSize))") // Visning av nåværende fontstørrelse
                    Slider(value: $settingsViewModel.fontSize, in: 10...30, step: 1) // Slider for å justere fontstørrelse
                }

                Section(header: Text("Notifications"),
                        footer: Text("With shared location, you can get personalized notifications based on your position.")) {
                    Toggle(isOn: $settingsViewModel.shareLocation) { // Toggle for å dele posisjon
                        Text("Share location")
                    }
                }
            }
            .navigationTitle("Settings")
        }
    }
}

#Preview {
    SettingsView(settingsViewModel: SettingsViewModel()) // Passer ViewModel til preview
}
