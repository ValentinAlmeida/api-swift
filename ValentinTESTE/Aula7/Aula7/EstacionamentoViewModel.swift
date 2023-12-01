import Foundation

// Classe responsável por gerenciar os dados dos estacionamentos
class EstacionamentoViewModel: ObservableObject {
    @Published var estacionamentos: [Estacionamento] = [] // Array de estacionamentos
    
    // Método para buscar os estacionamentos a partir da API
    func fetch() {
        guard let url = URL(string: "http://127.0.0.1:1880/valentinREAD") else {
            return // Retorna caso a URL seja inválida
        }
        
        URLSession.shared.dataTask(with: url) { [weak self] data, _, error in
            guard let data = data, error == nil else {
                if let error = error {
                    print("Erro na requisição:", error) // Imprime o erro da requisição, se houver
                }
                return // Retorna caso haja erro ou dados nulos
            }
            do {
                let parsed = try JSONDecoder().decode([Estacionamento].self, from: data) // Decodifica os dados da resposta da API para um array de Estacionamento
                DispatchQueue.main.async {
                    self?.estacionamentos = parsed // Atualiza o array de estacionamentos com os dados decodificados
                }
            } catch {
                print("Erro na decodificação:", error) // Imprime o erro de decodificação, se houver
            }
        }.resume() // Inicia a tarefa de busca dos dados
    }
}
