//
//  ScrapbookViewModel 2.swift
//  hobbyprosjekt
//
//  Created by Bruker on 07/10/2024.
//


import SwiftUI
import MapKit

class ScrapbookViewModel: ObservableObject {
}

struct ScrapbookView: View {
    
    let park = CLLocationCoordinate2D(
        latitude: 59.943319841960694,
        longitude: 10.707985893877561)
    
    let parken = CLLocationCoordinate2D(
        latitude: 59.92151146235126,
        longitude: 10.738631481817873)
    
    let park1 = CLLocationCoordinate2D(
        latitude: 59.93438260911862,
        longitude: 10.791204292550594)
    
    @State var camera: MapCameraPosition = .automatic
    
    var body: some View {
        Map(position: $camera) {
            Marker("Vigelandsparken",
                   systemImage: "tree",
                   coordinate: park).tint(.green)
            
            Marker("Pilestredet park",
                   systemImage: "tree",
                   coordinate: parken)
            Marker("Peer Gynt-parken",
                   systemImage: "tree",
                   coordinate: park1)
        }
        .safeAreaInset(edge: .bottom){
            HStack{
                Spacer()
                Button{
                    camera = .region(
                        MKCoordinateRegion(
                            center: park,
                            latitudinalMeters: 200,
                            longitudinalMeters: 200
                        )
                    )
                } label: {
                    Text("Reset")
                }
                Spacer()
            }
            .padding(.top)
            .background(.thinMaterial)
        }
        //Style på maps
        //.mapStyle(.imagery)
    }
}

struct ScrapbookView_Previews: PreviewProvider {
    static var previews: some View {
        ScrapbookView()
    }
}