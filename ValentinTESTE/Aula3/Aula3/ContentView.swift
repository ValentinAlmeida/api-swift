//
//  ContentView.swift
//  Aula3
//
//  Created by Student14_02 on 21/11/23.
//

import SwiftUI

struct ContentView: View {
    @State private var mostrarSheet = false
    var body: some View {
        NavigationStack{
            VStack {
                NavigationLink(destination: Modo1()){
                    Text("Modo 1")
                }
                NavigationLink(destination: Modo2()){
                    Text("Modo 2")
                }
                Button("Modo 3"){
                    mostrarSheet = true;
                }.sheet(isPresented: $mostrarSheet){
                    VStack{
                        Text("Edilson")
                        Text("Almeida")
                        Text("hackatruck.com.br")
                        Text("edilsonalmeida__")
                    }
                }
            }
            .padding()
        }
    }
}

struct Modo1: View {
    var body: some View {
        VStack {
            Text("Edilson")
            Text("Almeida")
            Text("hackatruck.com.br")
            Text("edilsonalmeida__")
        }
        .padding()
    }
}

struct Modo4: View {
    @Binding var name: String
    var body: some View {
        VStack {
            Text("Volte \(name)")
        }
        .padding()
    }
}

struct Modo2: View {
    @State public var name = ""
    var body: some View {
        NavigationStack{
            VStack {
                TextField("Digite seu nome", text: $name)
                Text("Estamos percorrendo um caminho \(name)")
                NavigationLink(destination: Modo4(name: $name)){
                    Text("Acessar Tela")
                }
            }
            .padding()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
