import Foundation

// Estrutura representando um carro da Disney, adotando os protocolos Decodable e Hashable
struct Carro: Decodable, Hashable {
    let modelo: String?  // Nome do carro
    let ano: Int?        // Ano de fabricação do carro
    let cor: String?    // Cor do carro
}
