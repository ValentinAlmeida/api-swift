//
//  Desafio3.swift
//  Aula1
//
//  Created by Student14_02 on 16/11/23.
//

import SwiftUI

struct Desafio3: View {
    @State private var number: String = "" // Usar String para TextField de texto

    var body: some View {
        VStack {
            TextField("Digite um valor", text: $number)
                .keyboardType(.numberPad) // Define o teclado para números

            Text("Valor: \(number.isEmpty ? "" : number)") // Exibe 0 se o campo estiver vazio
                .padding()
                .offset(y: -380)
        }
        .padding()
    }
}

struct Desafio3_Previews: PreviewProvider {
    static var previews: some View {
        Desafio3()
    }
}
