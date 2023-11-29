import Foundation

// Estrutura representando um personagem da Disney, adotando os protocolos Decodable e Hashable
struct DisneyCharacter: Decodable, Hashable {
    let _id: Int?           // Identificador único do personagem
    let films: [String]?    // Lista de filmes em que o personagem aparece
    let name: String?       // Nome do personagem
    let imageUrl: String?   // URL da imagem do personagem
    let createdAt: String?  // Data de criação do registro do personagem
    let updatedAt: String?  // Data de atualização do registro do personagem
}
