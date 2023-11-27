//
//  LocationView.swift
//  Aula5
//
//  Created by Student14_02 on 24/11/23.
//

import SwiftUI
import MapKit

struct MapView: View {
    // Estado que controla a região do mapa
    @State private var region = MKCoordinateRegion(
        center: CLLocationCoordinate2D(latitude: 0, longitude: 0),
        span: MKCoordinateSpan(latitudeDelta: 70, longitudeDelta: 70)
    )
    
    // Array de locais a serem exibidos no mapa
    var locations: [Location]
    
    // Estado que mantém o local selecionado atualmente
    @State private var selectedLocation: Location?
    
    var body: some View {
        // Mapa exibindo região e marcadores de locais
        Map(coordinateRegion: $region, annotationItems: locations) { location in
            // Marcador no mapa representando um local
            MapAnnotation(coordinate: location.coordinate) {
                // Ícone do marcador e ação ao ser tocado
                Image(systemName: "mappin.circle.fill")
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
        // Apresenta um detalhe do local selecionado em uma tela separada (sheet)
        .sheet(item: $selectedLocation) { location in
            LocationDetailView(location: location)
        }
    }
}
