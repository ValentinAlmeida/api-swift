import SwiftUI

// View responsável por criar um fundo gradiente
struct GradientBackground: View {
    var body: some View {
        LinearGradient(
            gradient: Gradient(colors: [Color.black, Color.blue]), // Gradiente da cor preta para a cor azul
            startPoint: .bottom,
            endPoint: .top
        )
        .edgesIgnoringSafeArea(.all) // Ignora as áreas seguras para preencher todo o espaço
    }
}

// Preview da GradientBackground para visualização
struct GradientBackground_Previews: PreviewProvider {
    static var previews: some View {
        GradientBackground()
    }
}
