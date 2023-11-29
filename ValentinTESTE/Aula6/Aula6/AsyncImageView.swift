// Importa o framework SwiftUI necessário para a View
import SwiftUI

// Uma View para exibir uma imagem carregada de forma assíncrona a partir de uma URL
struct AsyncImageView: View {
    @StateObject private var imageLoader = ImageLoader() // Cria uma instância de ImageLoader como um objeto observável
    let url: URL? // URL da imagem a ser carregada

    var body: some View {
        if let image = imageLoader.image { // Verifica se a imagem já foi carregada
            // Exibe a imagem carregada
            Image(uiImage: image)
                .resizable() // Permite redimensionar a imagem
                .aspectRatio(contentMode: .fit) // Mantém a proporção da imagem
        } else {
            // Exibe uma barra de progresso enquanto a imagem está sendo carregada
            ProgressView()
                .onAppear {
                    if let url = url { // Verifica se há uma URL válida para carregar a imagem
                        imageLoader.loadImage(from: url) // Carrega a imagem de forma assíncrona a partir da URL
                    }
                }
        }
    }
}
