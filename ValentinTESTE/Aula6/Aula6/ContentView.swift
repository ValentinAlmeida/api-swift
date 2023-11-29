import SwiftUI

struct ContentView: View {
    @StateObject var viewModel = DisneyCharactersViewModel() // Declaração de um objeto observável para gerenciar os dados dos personagens da Disney
    @State private var currentItemIndex = 0 // Declaração de uma variável de estado para controlar o índice do item atual exibido na tela
    
    var body: some View {
        NavigationView {
            VStack {
                if viewModel.disneyCharacters.isEmpty { // Verifica se a lista de personagens está vazia
                    ProgressView() // Exibe uma barra de progresso se os personagens ainda não foram carregados
                } else {
                    // Utiliza o ForEach para iterar sobre os índices dos personagens da Disney
                    ForEach(viewModel.disneyCharacters.indices, id: \.self) { index in
                        if index == currentItemIndex {
                            DisneyCharacterDetailView(character: viewModel.disneyCharacters[index]) // Exibe os detalhes do personagem atual
                                .transition(.opacity) // Aplica uma transição de opacidade
                        }
                    }
                    
                    NavigationButtonsView(
                        currentItemIndex: currentItemIndex,
                        totalCount: viewModel.disneyCharacters.count,
                        showPrevious: showPrevious,
                        showNext: showNext
                    ) // Exibe os botões de navegação para avançar ou retroceder entre os personagens
                }
            }
            .navigationTitle("Personagens da Disney") // Define o título da barra de navegação
            .onAppear {
                viewModel.fetchDisneyCharacters() // Quando a view aparece, solicita a busca dos personagens da Disney
            }
        }
    }

    // Função para exibir o personagem anterior
    func showPrevious() {
        guard currentItemIndex > 0 else { return } // Verifica se não é o primeiro personagem
        currentItemIndex -= 1 // Atualiza o índice para exibir o personagem anterior
    }
    
    // Função para exibir o próximo personagem
    func showNext() {
        guard currentItemIndex < viewModel.disneyCharacters.count - 1 else { return } // Verifica se não é o último personagem
        currentItemIndex += 1 // Atualiza o índice para exibir o próximo personagem
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
