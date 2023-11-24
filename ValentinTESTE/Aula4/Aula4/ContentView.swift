import SwiftUI

// Aqui começa a definição da View principal
struct ContentView: View {
    @StateObject var player = MusicPlayer() // Gerenciador do player de música
    @State private var isPlaying = false // Estado para controlar a reprodução
    @State private var selectedSong: Song? // Armazena a música selecionada

    let songs = allMusic() // Lista de todas as músicas disponíveis

    var body: some View {
        NavigationView {
            ZStack(alignment: .top) {
                GradientBackground().ignoresSafeArea() // Plano de fundo gradiente

                ScrollView {
                    VStack {
                        Image("truck") // Imagem do cabeçalho
                            .resizable()
                            .scaledToFit()
                            .frame(height: 200)

                        Text("HackaFM") // Título da aplicação
                            .font(.title)
                            .foregroundColor(.white)
                            .padding()
                            .frame(maxWidth: .infinity, alignment: .leading)

                        displaySongs() // Lista de músicas disponíveis

                        Text("Sugeridos") // Título para as músicas sugeridas
                            .font(.title)
                            .foregroundColor(.white)
                            .padding()
                            .frame(maxWidth: .infinity, alignment: .leading)

                        displaySuggestedSongs() // Lista de músicas sugeridas
                    }
                    .padding(.horizontal)
                }
            }
        }
    }

    // Mostra as músicas disponíveis
    func displaySongs() -> some View {
        ForEach(songs) { song in
            NavigationLink(destination: songDetailsView(for: song)) {
                songRowView(for: song) // Linha de exibição para cada música disponível
            }
        }
    }

    // Mostra os detalhes de uma música específica
    func songDetailsView(for song: Song) -> some View {
        ZStack {
            GradientBackground().ignoresSafeArea() // Plano de fundo gradiente
            VStack {
                AsyncImageView(url: URL(string: song.capa)) // Imagem da música
                    .frame(width: 300, height: 300)
                    .clipShape(Rectangle())
                    .padding()

                VStack(alignment: .leading) {
                    Text(song.name) // Nome da música
                        .foregroundColor(.white)

                    Text(song.artist) // Artista da música
                        .font(.caption)
                        .foregroundColor(.white)
                }
                .frame(maxWidth: .infinity)
                .frame(alignment: .center)

                playbackControls(for: song) // Controles de reprodução da música
            }
        }
    }

    // Mostra as informações de uma música na lista
    func songRowView(for song: Song) -> some View {
        HStack {
            AsyncImageView(url: URL(string: song.capa)) // Imagem da música na lista
                .frame(width: 50, height: 50)
                .clipShape(Rectangle())
                .padding()

            VStack(alignment: .leading) {
                Text(song.name) // Nome da música na lista
                    .foregroundColor(.white)

                Text(song.artist) // Artista da música na lista
                    .font(.caption)
                    .foregroundColor(.white)
            }
            .frame(maxWidth: .infinity, alignment: .leading)

            Spacer()

            Image(systemName: "heart") // Ícone para adicionar aos favoritos
                .foregroundColor(.white)
                .padding(.trailing)

            Image(systemName: "ellipsis") // Ícone de opções
                .foregroundColor(.white)
                .padding(.trailing)
        }
        .foregroundColor(.white)
    }

    // Controles de reprodução de música
    func playbackControls(for song: Song) -> some View {
        HStack {
            // Botão de retrocesso
            Button(action: {
                // Lógica para retroceder para a música anterior
            }) {
                Image(systemName: "backward.end.fill")
                    .foregroundColor(.white)
            }
            .padding()
            
            // Botão de reprodução/pausa
            Button(action: {
                if isPlaying {
                    player.pauseMusic() // Pausa a música se estiver sendo reproduzida
                } else {
                    player.playMusic(songFileName: song.name) // Inicia a música
                }
                isPlaying.toggle()
            }) {
                Image(systemName: isPlaying ? "pause.fill" : "play.fill") // Ícone de reprodução/pausa
                    .foregroundColor(.white)
            }
            .padding()
            
            // Botão de avanço
            Button(action: {
                // Lógica para avançar para a próxima música
            }) {
                Image(systemName: "forward.end.fill") // Ícone de avanço
                    .foregroundColor(.white)
            }
            .padding()
            
            // Botão de repetição
            Button(action: {
                // Lógica para alternar o modo de repetição
            }) {
                Image(systemName: "repeat") // Ícone de repetição
                    .foregroundColor(.white)
            }
            .padding()
        }
        .padding()
    }


    // Mostra as músicas sugeridas
    func displaySuggestedSongs() -> some View {
        ScrollView(.horizontal, showsIndicators: true) {
            HStack(spacing: 20) {
                ForEach(songs) { song in
                    suggestedSongView(for: song) // Exibição das músicas sugeridas
                }
            }
            .padding(.horizontal)
        }
    }

    // Mostra uma música sugerida
    func suggestedSongView(for song: Song) -> some View {
        VStack {
            AsyncImageView(url: URL(string: song.capa)) // Imagem da música sugerida
                .frame(width: 100, height: 100)
                .clipShape(Rectangle())

            Text(song.name) // Nome da música sugerida
                .foregroundColor(.white)
                .frame(maxWidth: .infinity, alignment: .leading)

            Text(song.artist) // Artista da música sugerida
                .font(.caption)
                .foregroundColor(.white)
                .frame(maxWidth: .infinity, alignment: .leading)
        }
        .frame(width: 100)
        .padding()
        .background(Color.gray.opacity(0.5)) // Fundo cinza com opacidade
        .cornerRadius(10) // Cantos arredondados
    }
}

// Preview da ContentView
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
