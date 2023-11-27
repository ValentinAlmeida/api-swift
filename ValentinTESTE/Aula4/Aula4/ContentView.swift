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

    @State private var scaleBackward: CGFloat = 1.0
    @State private var scalePlayPause: CGFloat = 1.0
    @State private var scaleForward: CGFloat = 1.0
    @State private var scaleRepeat: CGFloat = 1.0
    
    // Restante do seu código...
    
    func playbackControls(for song: Song) -> some View {
        HStack {
            // Botão de retrocesso
            Button(action: {
                withAnimation {
                    scaleBackward = 1.5
                    // Sua lógica de retrocesso aqui...
                }
                resetScaleBackward()
            }) {
                Image(systemName: "backward.end.fill")
                    .foregroundColor(.white)
                    .scaleEffect(scaleBackward)
            }
            .padding()
            
            // Botão de reprodução/pausa
            Button(action: {
                withAnimation {
                    if isPlaying {
                        player.pauseMusic()
                    } else {
                        player.playMusic(songFileName: song.name)
                    }
                    isPlaying.toggle()
                    scalePlayPause = 1.5
                }
                resetScalePlayPause()
            }) {
                Image(systemName: isPlaying ? "pause.fill" : "play.fill")
                    .foregroundColor(.white)
                    .scaleEffect(scalePlayPause)
            }
            .padding()
            
            // Botão de avanço
            Button(action: {
                withAnimation {
                    scaleForward = 1.5
                    // Sua lógica de avanço aqui...
                }
                resetScaleForward()
            }) {
                Image(systemName: "forward.end.fill")
                    .foregroundColor(.white)
                    .scaleEffect(scaleForward)
            }
            .padding()
            
            // Botão de repetição
            Button(action: {
                withAnimation {
                    scaleRepeat = 1.5
                    // Sua lógica de repetição aqui...
                }
                resetScaleRepeat()
            }) {
                Image(systemName: "repeat")
                    .foregroundColor(.white)
                    .scaleEffect(scaleRepeat)
            }
            .padding()
        }
        .padding()
    }
    
    private func resetScaleBackward() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
            withAnimation {
                scaleBackward = 1.0
            }
        }
    }
    
    private func resetScalePlayPause() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
            withAnimation {
                scalePlayPause = 1.0
            }
        }
    }
    
    private func resetScaleForward() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
            withAnimation {
                scaleForward = 1.0
            }
        }
    }
    
    private func resetScaleRepeat() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
            withAnimation {
                scaleRepeat = 1.0
            }
        }
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
