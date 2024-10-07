import SwiftUI
import SwiftData

struct HomeScreenView: View {
    @StateObject var countriesViewModel = CountriesViewModel()
    @EnvironmentObject var settingsViewModel: SettingsViewModel

    var body: some View {
        TabView {
            NavigationView {
                List {
                    ForEach(countriesViewModel.filterCountries, id: \.self) { country in
                        HStack {
                            Text(country.name.common)
                                .font(.system(size: settingsViewModel.fontSize))
                            if settingsViewModel.showFlags {
                                Text(country.flag)
                                    .font(.system(size: settingsViewModel.fontSize))
                            }
                        }
                        .padding(3)
                    }
                }
                .navigationTitle(NSLocalizedString("Country", comment: "Country")) // Bruker oversettelse
                .onAppear {
                    countriesViewModel.getData()
                }
                .searchable(text: $countriesViewModel.searchText)
            }
            .tabItem {
                Label("Home", systemImage: "house")
            }
            ScrapbookView()
                .tabItem {
                    Label("Map", systemImage: "map")
                }
            SettingsView(settingsViewModel: settingsViewModel)
                .tabItem {
                    Label("Settings", systemImage: "gear")
                }
        }
        .preferredColorScheme(settingsViewModel.isDarkMode ? .dark : .light)
    }
}

#Preview {
    HomeScreenView()
        .environmentObject(SettingsViewModel())
}
