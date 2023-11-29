import Foundation

// Estrutura para decodificar a resposta da API
struct DataResponse: Decodable {
    let data: [DisneyCharacter] // Array de objetos DisneyCharacter na resposta da API
}

// Classe responsável por gerenciar os dados dos personagens da Disney
class DisneyCharactersViewModel: ObservableObject {
    @Published var disneyCharacters: [DisneyCharacter] = [] // Array de personagens da Disney
    
    // Método para buscar os personagens da Disney a partir da API
    func fetchDisneyCharacters() {
        guard let url = URL(string: "https://api.disneyapi.dev/character") else {
            return // Retorna caso a URL seja inválida
        }
        
        URLSession.shared.dataTask(with: url) { [weak self] data, _, error in
            guard let data = data, error == nil else {
                return // Retorna caso haja erro ou dados nulos
            }
            do {
                let parsedCharacters = try JSONDecoder().decode(DataResponse.self, from: data) // Decodifica os dados da resposta da API
                DispatchQueue.main.async {
                    self?.disneyCharacters = parsedCharacters.data // Atualiza o array de personagens da Disney com os dados decodificados
                }
            } catch {
                print(error) // Imprime o erro caso ocorra um problema na decodificação
            }
        }.resume() // Inicia a tarefa de busca dos dados
    }
}
