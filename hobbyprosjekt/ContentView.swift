//
//  ContentView.swift
//  hobbyprosjekt
//
//  Created by Sakitha Baskaran on 17/07/2024.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    /*
    @Environment(\.modelContext) private var modelContext
    @Query private var items: [Item]

    var body: some View {
        NavigationSplitView {
            List {
                ForEach(items) { item in
                    NavigationLink {
                        Text("Item at \(item.timestamp, format: Date.FormatStyle(date: .numeric, time: .standard))")
                    } label: {
                        Text(item.timestamp, format: Date.FormatStyle(date: .numeric, time: .standard))
                    }
                }
                .onDelete(perform: deleteItems)
            }
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    EditButton()
                }
                ToolbarItem {
                    Button(action: addItem) {
                        Label("Add Item", systemImage: "plus")
                    }
                }
            }
        } detail: {
            Text("Select an item")
        }
    }

    private func addItem() {
        withAnimation {
            let newItem = Item(timestamp: Date())
            modelContext.insert(newItem)
        }
    }

    private func deleteItems(offsets: IndexSet) {
        withAnimation {
            for index in offsets {
                modelContext.delete(items[index])
            }
        }
    }*/
    
    @State private var searchText: String = ""
    @State private var europeanCountries: [String] = [
        //europeiske land:
        "Albania", "Andorra", "Armenia", "Østerike", "Azerbaijan", "Belarus", "Belgia",
        "Bosnia and Herzegovina", "Bulgaria", "Kroatia", "Cyprus", "Tsjekkia",
        "Denmark", "Estonia", "Finland", "Frankrike", "Georgia", "Tyskland", "Hellas",
        "Ungarn", "Island", "Irland", "Italia", "Kazakhstan", "Kosovo", "Latvia",
        "Liechtenstein", "Litauen", "Luxembourg", "Malta", "Moldova", "Monaco",
        "Montenegro", "Nederland", "Nord Macedonia", "Norge", "Poland", "Portugal",
        "Romania", "Russland", "San Marino", "Serbia", "Slovakia", "Slovenia", "Spania",
        "Sverige", "Sveits", "Tyrkia", "Ukraina", "Storbritannia", "Vaticanstaten",

        //afrikanske land:
        // Denne skal byttes til ASIATISKE land!
        "Algerie", "Angola", "Benin", "Botswana", "Burkina Faso", "Burundi", "Cape Verde", "Den sentralafrikanske republikk",
        "Chad", "Comorene", "Kongo", "Demokratisk republikken Kongo", "Djibouti", "Egypt", "Ekvatorial-Guinea", "Eritrea",
        "Eswatini", "Etiopia", "Gabon", "Gambia", "Ghana", "Guinea", "Guinea-Bissau", "Elfenbenskysten", "Kenya",
        "Lesotho", "Liberia", "Libya", "Madagaskar", "Malawi", "Mali", "Mauritania", "Mauritius", "Marokko",
        "Mosambik", "Namibia", "Niger", "Nigeria", "Rwanda", "Sao Tome og Principe", "Senegal", "Seychellene", "Sierra Leone",
        "Somalia", "Sør-Sudan", "Sør-Afrika", "Sudan", "Tanzania", "Togo", "Tunisia", "Uganda", "Zambia", "Zimbabwe"
    ]

    var body: some View {
        VStack {
            HStack {
                TextField("Søk opp land...", text: $searchText)
                    .padding(8)
                    .background(Color(.systemGray6))
                    .cornerRadius(8)
                    .padding(.horizontal)
            }
            .padding(.top)

            List(filteredCountries, id: \.self) { country in
                Text(country)
            }
        }
    }

    var filteredCountries: [String] {
        if searchText.isEmpty {
            return europeanCountries
        } else {
            return europeanCountries.filter { $0.localizedCaseInsensitiveContains(searchText) }
        }
    }

    func search() {
        // Implementer søkelogikk om nødvendig
        print("Searching for \(searchText)")
    }
}

#Preview {
    ContentView()
}
