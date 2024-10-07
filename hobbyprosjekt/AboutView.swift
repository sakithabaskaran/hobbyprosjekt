import SwiftUI

struct AboutView: View {
    var body: some View {
        ScrollView { // Legg til ScrollView for å håndtere lang tekst
            VStack(alignment: .leading, spacing: 20) {
                //Bytt ut med logoen vår
                Image("jorda")
                    .resizable()
                    .scaledToFit()
                    .frame(height: 80)
                    .padding(.bottom, 20)
                
                Text("About Svindelapp")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .padding(.bottom, 10)
                
                Text("The Svindelapp has been developed to assist users in identifying and avoiding fraud in countries they visit. With our app, you get access to essential tools and comprehensive information that are useful to protect yourself from fraud and unpleasant situations.")
                    .font(.body)
                    .padding(.bottom, 10)
                
                Text("In addition, we offer functions such as scrapbook and favourites, which give you the opportunity to organize and store important information and memories.")
                    .font(.body)
                    .padding(.bottom, 10)
                
                Text("Developed by:")
                    .font(.headline)
                    .padding(.bottom, 5)
                
                Text("Sakitha Baskaran\nNivethika Ganeshan")
                    .font(.subheadline)
                    .foregroundColor(.secondary)
                
                Spacer()
            }
            .padding()
            .background(Color(UIColor.systemBackground)) // Bakgrunnsfarge
            .cornerRadius(15) // Rundede kanter på bakgrunnen
            .shadow(radius: 5) // Skyggeeffekt for dybde
            .navigationTitle("Om Appen")
            .navigationBarTitleDisplayMode(.inline) // Gjør tittelen mer kompakt
        }
        .padding() // Legg til padding for å skille innholdet fra kanten
    }
}

#Preview {
    AboutView()
}

