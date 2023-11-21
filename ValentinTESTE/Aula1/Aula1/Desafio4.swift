//
//  Desafio4.swift
//  Aula1
//
//  Created by Student14_02 on 20/11/23.
//

import SwiftUI

struct Desafio4: View {
    @State private var peso: String = ""
    @State private var altura: String = ""
    @State private var imc: Double = 0.0 // Variável para armazenar o resultado do cálculo do IMC
    
    var body: some View {
        ZStack{
            getBackgroundColor(imc)
                .ignoresSafeArea()
        VStack {
            Text("Calculadora de IMC \(peso)")
                .font(.system(size: 30))
                .multilineTextAlignment(.center)
                .padding(.top, -20)
            
            TextField("Digite seu Peso", text: $peso)
                .padding()
                .background(Color.white)
                .cornerRadius(8)
                .overlay(
                    RoundedRectangle(cornerRadius: 8)
                        .stroke(Color.gray, lineWidth: 1)
                )
                .textFieldStyle(PlainTextFieldStyle())
                .keyboardType(.numberPad)
                .multilineTextAlignment(.center)
                .frame(maxWidth: .infinity)
                .frame(height: 40)
                .padding([.leading, .trailing])
            
            TextField("Digite sua Altura", text: $altura)
                .padding()
                .background(Color.white)
                .cornerRadius(8)
                .overlay(
                    RoundedRectangle(cornerRadius: 8)
                        .stroke(Color.gray, lineWidth: 1)
                )
                .textFieldStyle(PlainTextFieldStyle())
                .keyboardType(.numberPad)
                .multilineTextAlignment(.center)
                .frame(maxWidth: .infinity)
                .frame(height: 40)
                .padding([.leading, .trailing])
            
            Button(action: {
                // Ao clicar no botão, realizar o cálculo do IMC
                if let pesoValue = Double(peso), let alturaValue = Double(altura), pesoValue > 0, alturaValue > 0 {
                    let imcCalculado = pesoValue / (alturaValue * alturaValue)
                    imc = imcCalculado
                }
            }) {
                Text("Calcular")
                    .padding()
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(8)
            }
            .padding(.top, 20)
            
            if imc > 0 {
                Text(getIMCDescription(imc))
                    .padding()
                    .font(.headline)
                    .multilineTextAlignment(.center)
            }
            
            Image("tabela-IMC")
                .resizable()
                .aspectRatio(contentMode: .fit)
        }
        .padding()
    }
    }
    func getIMCDescription(_ imc: Double) -> String {
            switch imc {
            case ..<18.5:
                return "Baixo Peso"
            case 18.5..<25.0:
                return "Normal"
            case 25.0..<30.0:
                return "Sobrepeso"
            default:
                return "Obesidade"
            }
        }
    func getBackgroundColor(_ imc: Double) -> Color {
            switch imc {
            case ..<18.5:
                return Color("Baixo Peso") // Altere para a cor desejada para Baixo Peso
            case 18.5..<25.0:
                return Color("Normal") // Altere para a cor desejada para Normal
            case 25.0..<30.0:
                return Color("Sobrepeso")// Altere para a cor desejada para Sobrepeso
            default:
                return Color("Obesidade") // Altere para a cor desejada para Obesidade
            }
        }
}


struct Desafio4_Previews: PreviewProvider {
    static var previews: some View {
        Desafio4()
    }
}
