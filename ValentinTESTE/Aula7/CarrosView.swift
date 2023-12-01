//
//  CarrosView.swift
//  Aula7
//
//  Created by Student14_02 on 01/12/23.
//

import SwiftUI

struct CarrosView: View {
    var carros: [Carro]

    var body: some View {
        NavigationView {
            List(carros, id: \.self) { carro in
                VStack(alignment: .leading) {
                    Text("Modelo: \(carro.modelo ?? "N/A")")
                    if let ano = carro.ano {
                        Text("Ano: \(ano)")
                    } else {
                        Text("Ano: N/A")
                    }
                    Text("Cor: \(carro.cor ?? "N/A")")
                }
                .padding(.leading, 20)
            }
            .navigationBarTitle("Carros")
        }
    }
}
