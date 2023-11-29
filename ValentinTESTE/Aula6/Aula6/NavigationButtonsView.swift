// Importa o framework SwiftUI necessário para a View
import SwiftUI

// Uma View que exibe os botões de navegação para avançar ou retroceder entre itens
struct NavigationButtonsView: View {
    let currentItemIndex: Int // Índice do item atual
    let totalCount: Int // Número total de itens
    let showPrevious: () -> Void // Função de callback para exibir o item anterior
    let showNext: () -> Void // Função de callback para exibir o próximo item
    
    var body: some View {
        HStack {
            // Botão para exibir o item anterior
            Button(action: showPrevious) {
                Image(systemName: "arrow.left.circle.fill") // Ícone de seta para a esquerda
                    .font(.title) // Define o tamanho do ícone
            }
            .padding() // Adiciona espaçamento ao redor do botão
            .disabled(currentItemIndex == 0) // Desabilita o botão se o item atual for o primeiro
            
            Spacer() // Adiciona um espaço flexível entre os botões
            
            // Botão para exibir o próximo item
            Button(action: showNext) {
                Image(systemName: "arrow.right.circle.fill") // Ícone de seta para a direita
                    .font(.title) // Define o tamanho do ícone
            }
            .padding() // Adiciona espaçamento ao redor do botão
            .disabled(currentItemIndex == totalCount - 1) // Desabilita o botão se o item atual for o último
        }
    }
}
