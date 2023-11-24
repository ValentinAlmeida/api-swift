//
//  ContentView.swift
//  Aula1
//
//  Created by Student14_02 on 16/11/23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        GeometryReader { geometry in // Use do GeometryReader para acessar informações sobre o espaço de layout disponível.
            VStack { // Empilha as visualizações verticalmente.
                Image("caminhao") // Adiciona uma imagem chamada "caminhao".
                    .resizable() // Permite redimensionamento da imagem.
                    .aspectRatio(contentMode: .fit) // Define o modo de aspectRatio da imagem para .fit.
                    .alignmentGuide(.top) { _ in // Define um alinhamento vertical da imagem.
                        0 // Mantém a imagem alinhada no topo do VStack.
                    }

                ZStack { // Coloca visualizações uma sobre a outra.
                    Image("caminhao") // Adiciona outra imagem chamada "caminhao".
                        .resizable() // Permite redimensionamento da imagem.
                        .aspectRatio(contentMode: .fit) // Define o modo de aspectRatio da imagem para .fit.
                        .clipShape(Circle()) // Corta a imagem em forma de círculo.
                        .frame(width: 400, height: 400) // Define o tamanho do quadro da imagem.

                    Text("Hackatruck") // Adiciona um texto "Hackatruck".
                        .font(.system(size: 35)) // Define o tamanho da fonte.
                        .offset(y: -70) // Desloca o texto para cima.
                        .fontWeight(.bold) // Define o peso da fonte como negrito.
                        .foregroundColor(.blue) // Define a cor do texto como azul.
                }
                .offset(y: -35)

                HStack { // Empilha as visualizações horizontalmente.
                HStack { // Empilha as visualizações horizontalmente.
                    Text("Maker") // Adiciona um texto "Maker".
                        .foregroundColor(.yellow) // Define a cor do texto como amarelo.

                    Text("Space") // Adiciona um texto "Space".
                        .foregroundColor(.red) // Define a cor do texto como vermelho.
                }
                .font(.system(size: 30)) // Define o tamanho da fonte para o HStack.
                .padding(.top, -30) // Ajusta o espaçamento acima do HStack para cima.
                .background(
                Rectangle()
                    .foregroundColor(.black)
                    .frame(width: 300, height: 260)
                    .padding(.bottom, -75)
                )
            }
        }
    }
}



struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
