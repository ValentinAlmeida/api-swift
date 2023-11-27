//
//  ContentView.swift
//  Aula5
//
//  Created by Student14_02 on 24/11/23.
//

import SwiftUI
import MapKit

struct ContentView: View {
    @State var nomeEscolhido = "" // Mantém o nome do local escolhido
    
    // Cria um array de locations usando a função createLocations()
    let locations = createLocations()
    
    var body: some View {
        VStack {
            Text("World map")
                .font(.title)
                .bold()
            Text(nomeEscolhido) // Exibe o nome do local escolhido
            
            MapView(locations: locations) // Exibe o mapa com os locations
                .edgesIgnoringSafeArea(.all)
            
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 10) {
                    ForEach(locations) { location in
                        Button(action: {
                            nomeEscolhido = location.name // Atualiza o nome do local escolhido
                        }) {
                            Text(location.name) // Exibe o nome do local como botão
                                .padding()
                                .background(Color.blue)
                                .foregroundColor(.white)
                                .cornerRadius(10)
                        }
                    }
                }
                .padding(.horizontal)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
