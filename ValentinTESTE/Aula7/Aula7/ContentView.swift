import SwiftUI

struct ContentView: View {
    @ObservedObject var viewModel = EstacionamentoViewModel()
    @State private var isShowingCarrosView = false
    @State private var selectedEstacionamento: Estacionamento? = nil

    var body: some View {
        NavigationView {
            List(viewModel.estacionamentos, id: \.self) { estacionamento in
                VStack(alignment: .leading) {
                    Text("Nome: \(estacionamento.nomeEstacionamento ?? "N/A")")
                    Text("Endereço: \(estacionamento.endereco ?? "N/A")")
                    if let vagas = estacionamento.vagas {
                        Text("Vagas disponíveis: \(vagas)")
                    } else {
                        Text("Vagas disponíveis: N/A")
                    }
                }
                .onTapGesture {
                    selectedEstacionamento = estacionamento
                    if let _ = selectedEstacionamento?.carros {
                        isShowingCarrosView = true
                    } else {
                        print("Carros não carregados ainda")
                        // Aqui você pode adicionar um aviso ao usuário, se necessário
                    }
                }
            }
            .navigationBarTitle("Estacionamentos")
        }
        .onAppear {
            viewModel.fetch()
        }
        .sheet(isPresented: $isShowingCarrosView) {
            if let carros = selectedEstacionamento?.carros {
                CarrosView(carros: carros)
            } else {
                Text("Nenhum carro registrado")
            }
        }
    }
}

// Preview da ContentView
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
