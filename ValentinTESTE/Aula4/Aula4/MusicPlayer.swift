import Foundation
import AVFoundation

// Definição da classe MusicPlayer
class MusicPlayer: ObservableObject {
    var audioPlayer: AVAudioPlayer?

    // Função para reproduzir uma música com base no nome do arquivo
    func playMusic(songFileName: String) {
        // Verifica se o caminho do arquivo de áudio pode ser encontrado no Bundle principal
        if let path = Bundle.main.path(forResource: songFileName, ofType: "mp3") {
            do {
                // Inicializa o AVAudioPlayer com o conteúdo do arquivo no URL do caminho
                audioPlayer = try AVAudioPlayer(contentsOf: URL(fileURLWithPath: path))
                
                // Inicia a reprodução da música
                audioPlayer?.play()
            } catch {
                // Captura e imprime qualquer erro ocorrido durante a reprodução
                print("Erro ao reproduzir a música: \(error.localizedDescription)")
            }
        } else {
            // Imprime uma mensagem caso o caminho do arquivo de áudio não seja encontrado
            print("Caminho do arquivo de áudio não encontrado")
        }
    }
    
    // Função para pausar a reprodução da música
    func pauseMusic() {
        audioPlayer?.pause()
    }
}
