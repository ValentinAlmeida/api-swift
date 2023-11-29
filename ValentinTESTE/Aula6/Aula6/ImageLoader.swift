// Importa o framework SwiftUI necessário para a classe ImageLoader
import SwiftUI

// Classe para carregar a imagem de forma assíncrona a partir de uma URL
class ImageLoader: ObservableObject {
    // Publica a imagem carregada para que as visualizações possam ser atualizadas quando a imagem for carregada
    @Published var image: UIImage?
    
    // Método para carregar a imagem de uma URL
    func loadImage(from url: URL) {
        // Cria uma sessão URLSession compartilhada para fazer a solicitação de dados da URL
        URLSession.shared.dataTask(with: url) { data, response, error in
            // Verifica se houve algum erro ou se os dados foram recebidos com sucesso
            if let data = data, let loadedImage = UIImage(data: data) {
                // Atualiza a imagem na thread principal, já que as atualizações de IU devem ser feitas na thread principal
                DispatchQueue.main.async {
                    self.image = loadedImage // Atribui a imagem carregada à variável image
                }
            }
        }.resume() // Inicia a tarefa de carregamento de dados
    }
}
