//
//  Song.swift
//  Aula4
//
//  Created by Student14_02 on 22/11/23.
//

import SwiftUI

// Definição da estrutura Song, que representa uma música identificável
struct Song: Identifiable {
    var id: Int // Identificador único da música
    var name: String // Nome da música
    var artist: String // Nome do artista
    var capa: String // URL da capa da música
}

// Função que retorna um array de todas as músicas disponíveis
func allMusic() -> [Song] {
    // Array contendo exemplos de músicas (você pode adicionar mais músicas da mesma maneira)
    let arrayMusicas = [
        Song(id: 1, name: "Borboletas", artist: "Xuxa", capa: "https://upload.wikimedia.org/wikipedia/pt/f/f8/Xou_da_Xuxa.JPG"),
        Song(id: 2, name: "Borboletas", artist: "Xuxa", capa: "https://upload.wikimedia.org/wikipedia/pt/f/f8/Xou_da_Xuxa.JPG"),
        Song(id: 3, name: "Borboletas", artist: "Xuxa", capa: "https://upload.wikimedia.org/wikipedia/pt/f/f8/Xou_da_Xuxa.JPG"),
        Song(id: 4, name: "Borboletas", artist: "Xuxa", capa: "https://upload.wikimedia.org/wikipedia/pt/f/f8/Xou_da_Xuxa.JPG"),
        Song(id: 5, name: "Borboletas", artist: "Xuxa", capa: "https://upload.wikimedia.org/wikipedia/pt/f/f8/Xou_da_Xuxa.JPG"),
        Song(id: 6, name: "Borboletas", artist: "Xuxa", capa: "https://upload.wikimedia.org/wikipedia/pt/f/f8/Xou_da_Xuxa.JPG"),
        Song(id: 7, name: "Borboletas", artist: "Xuxa", capa: "https://upload.wikimedia.org/wikipedia/pt/f/f8/Xou_da_Xuxa.JPG"),
        Song(id: 8, name: "Borboletas", artist: "Xuxa", capa: "https://upload.wikimedia.org/wikipedia/pt/f/f8/Xou_da_Xuxa.JPG"),
        Song(id: 9, name: "Borboletas", artist: "Xuxa", capa: "https://upload.wikimedia.org/wikipedia/pt/f/f8/Xou_da_Xuxa.JPG"),
        Song(id: 10, name: "Borboletas", artist: "Xuxa", capa: "https://upload.wikimedia.org/wikipedia/pt/f/f8/Xou_da_Xuxa.JPG")
        
        // Você pode adicionar mais músicas aqui da mesma maneira
    ]
    return arrayMusicas// Retorna o array de músicas
}
