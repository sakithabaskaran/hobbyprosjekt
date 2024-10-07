import SwiftUI

struct WiFiView: View {
    @StateObject var viewModel = WiFiViewModel() // Initialiserer ViewModel
    
    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            Toggle(isOn: .constant(true)) {
                Text("Wi-Fi på/av")
            }

            Text("NETTVERK")
                .font(.headline)
                .foregroundColor(.gray)

            List(viewModel.availableNetworks, id: \.self) { network in
                Text(network)
            }
            .onAppear {
                viewModel.fetchAvailableNetworks() // Henter nettverk når visningen vises
            }
            
            Spacer()
        }
        .padding()
        .navigationTitle("Wi-Fi")
        .navigationBarTitleDisplayMode(.inline) // Gjør tittelen mer kompakt
    }
}

#Preview {
    WiFiView()
}
