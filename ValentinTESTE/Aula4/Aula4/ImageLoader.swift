import SwiftUI
import Foundation

// Classe responsável por carregar imagens de um URL
public class ImageLoader: ObservableObject {
    @Published var image: UIImage? // Imagem carregada do URL
    
    // Inicializador da classe ImageLoader
    init(url: URL?) {
        if let imageUrl = url {
            // Cria uma URLSession para fazer a requisição da imagem a partir do URL
            URLSession.shared.dataTask(with: imageUrl) { data, response, error in
                // Verifica se há dados retornados sem erros
                if let data = data, let loadedImage = UIImage(data: data) {
                    DispatchQueue.main.async {
                        // Atualiza a imagem carregada na thread principal
                        self.image = loadedImage
                    }
                }
            }.resume() // Inicia a tarefa de download da imagem
        }
    }
}
