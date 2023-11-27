//
//  LocationDetail.swift
//  Aula5
//
//  Created by Student14_02 on 27/11/23.
//

import Foundation
import SwiftUI
import MapKit

struct LocationDetailView: View {
    let location: Location // Recebe um objeto Location para exibir detalhes

    var body: some View {
        VStack {
            // Exibe o nome do local com formatação de título
            Text(location.name)
                .font(.title)
                .padding()

            // Exibe um ícone ou bandeira associado ao local
            Text(location.flagIcon)
                .font(.system(size: 50))
                .padding()

            // Exibe a descrição do local
            Text(location.description)
                .padding()

            Spacer() // Adiciona um espaço flexível abaixo do conteúdo
        }
        .padding() // Adiciona preenchimento ao redor do conteúdo
    }
}
