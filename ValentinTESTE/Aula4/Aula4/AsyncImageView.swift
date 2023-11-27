import SwiftUI

// View que carrega uma imagem de forma assíncrona a partir de um URL usando ImageLoader
struct AsyncImageView: View {
    @StateObject private var imageLoader: ImageLoader // Carregador de imagem
    
    // Inicializador que recebe um URL para carregar a imagem
    init(url: URL?) {
        _imageLoader = StateObject(wrappedValue: ImageLoader(url: url)) // Inicializa o ImageLoader com o URL
    }
    
    var body: some View {
        if let uiImage = imageLoader.image {
            // Se a imagem estiver carregada, exibe-a redimensionável
            Image(uiImage: uiImage)
                .resizable()
        } else {
            // Caso contrário, pode exibir um placeholder ou indicador de carregamento
            Text("Carregando...") // Exibe "Carregando..." enquanto a imagem é carregada
        }
    }
}
