//
//  Desafio3.swift
//  Aula1
//
//  Created by Student14_02 on 16/11/23.
//

import SwiftUI

struct Desafio3: View {
    @State private var name = "" // Use @State para que as mudanças sejam refletidas na View

    var body: some View {
        VStack {
            TextField("Digite seu nome", text: $name)
                .offset(x: 120, y: -270)

            Text("Bem vindo, \(name.isEmpty ? "visitante" : name)") // Exibe "visitante" se o nome estiver vazio
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
