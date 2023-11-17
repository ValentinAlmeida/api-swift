//
//  SwiftUIView.swift
//  Aula1
//
//  Created by Student14_02 on 16/11/23.
//

import SwiftUI

struct SwiftUIView: View {
    var body: some View {
        VStack { // Empilha as visualizações verticalmente.
            Image("caminhao") // Adiciona uma imagem chamada "caminhao".
                .resizable() // Permite redimensionamento da imagem.
                .aspectRatio(contentMode: .fit) // Define o modo de aspectRatio da imagem para .fit.
                .frame(width: 360, height: 400) // Define o tamanho do quadro da imagem.

            Text("HackaTruck") // Adiciona um texto "HackaTruck".
                .bold() // Define o texto como negrito.
                .foregroundColor(.blue) // Define a cor do texto como azul.
                .font(.system(size: 35)) // Define o tamanho da fonte.
                .fontWeight(.bold) // Define o peso da fonte como negrito.
                .padding(.top, -60) // Ajusta o espaçamento acima do texto para cima.

            HStack { // Empilha as visualizações horizontalmente.
                Text("Maker") // Adiciona um texto "Maker".
                    .foregroundColor(.yellow) // Define a cor do texto como amarelo.
                
                Text("Space") // Adiciona um texto "Space".
                    .foregroundColor(.red) // Define a cor do texto como vermelho.
            }
            .font(.title) // Define o tamanho da fonte para o HStack.
            .padding(.top, -40) // Ajusta o espaçamento acima do HStack para cima.
        }
    }
}

struct SwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
        SwiftUIView()
    }
}
