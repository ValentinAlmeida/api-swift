// Importa o framework SwiftUI necessário para a View
import SwiftUI

struct DisneyCharacterDetailView: View {
    let character: DisneyCharacter // Recebe um objeto do tipo DisneyCharacter para exibir seus detalhes
    
    var body: some View {
        VStack {
            // Verifica se há uma URL válida para a imagem do personagem
            if let imageUrl = character.imageUrl,
               let url = URL(string: imageUrl) {
                // Exibe uma AsyncImageView para carregar e exibir a imagem do personagem a partir da URL
                AsyncImageView(url: url)
                    .frame(width: 200, height: 200) // Define o tamanho da imagem
                    .cornerRadius(8) // Aplica um canto arredondado à imagem
            } else {
                Text("Imagem não disponível") // Exibe um texto se a URL da imagem não estiver disponível
                    .padding()
            }
            
            Text("Nome: \(character.name ?? "Sem nome explicito")") // Exibe o nome do personagem
                .font(.headline) // Define o estilo de fonte para o nome
                .padding() // Adiciona um espaçamento ao redor do texto
            
            Text("Filmes: \(character.films?.joined(separator: ", ") ?? "Sem filmes")") // Exibe os filmes em que o personagem aparece
                .font(.body) // Define o estilo de fonte para a lista de filmes
                .padding() // Adiciona um espaçamento ao redor do texto
        }
        .padding() // Adiciona um espaçamento ao redor do VStack
        .background(Color.gray.opacity(0.2)) // Define um fundo cinza com opacidade
        .cornerRadius(12) // Aplica cantos arredondados ao VStack
        .padding() // Adiciona um espaçamento geral
    }
}
