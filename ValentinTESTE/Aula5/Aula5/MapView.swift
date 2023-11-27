//
//  LocationView.swift
//  Aula5
//
//  Created by Student14_02 on 24/11/23.
//

import SwiftUI
import MapKit

struct MapView: View {
    @State private var region = MKCoordinateRegion(
        center: CLLocationCoordinate2D(latitude: 0, longitude: 0),
        span: MKCoordinateSpan(latitudeDelta: 70, longitudeDelta: 70)
    )
    
    var locations: [Location]
    @Binding var nomeEscolhido: String // Vinculação à variável de estado nomeEscolhido
    
    @State private var selectedLocation: Location?
    
    var body: some View {
        Map(coordinateRegion: $region, annotationItems: locations) { location in
            MapAnnotation(coordinate: location.coordinate) {
                Text(location.flagIcon)
                    .foregroundColor(.blue)
                    .onTapGesture {
                        selectedLocation = location // Seleciona o local ao ser tocado
                    }
            }
        }
        .onAppear {
            // Ao aparecer, define o centro do mapa no primeiro local, se existir
            if let firstLocation = locations.first {
                region.center = firstLocation.coordinate
            }
        }
        .sheet(item: $selectedLocation) { location in
            LocationDetailView(location: location)
        }
        .onChange(of: nomeEscolhido) { newValue in
            // Verifica se há uma localização correspondente ao nome escolhido e atualiza a região do mapa
            if let selectedLocation = locations.first(where: { $0.name == newValue }) {
                updateRegionForLocation(selectedLocation)
            }
        }
    }
    
    // Esta função atualiza a região do mapa para centralizar na localização fornecida
    private func updateRegionForLocation(_ location: Location) {
        region.center = location.coordinate
    }
}
