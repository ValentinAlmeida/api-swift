import Foundation

struct Data : Decodable {
    let data : [DisneyCharacter]
}

class DisneyCharactersViewModel: ObservableObject {
    
    @Published var disneyCharacters: [DisneyCharacter] = []
    
    func fetchDisneyCharacters() {
        guard let url = URL(string: "https://api.disneyapi.dev/character") else {
            return
        }
        
        URLSession.shared.dataTask(with: url) { [weak self] data, _, error in
            guard let data = data, error == nil else {
                return
            }
            do {
                let parsedCharacters = try JSONDecoder().decode(Data.self, from: data)
                
                DispatchQueue.main.async {
                    self?.disneyCharacters = parsedCharacters.data
                }
            } catch {
                print(error)
            }
        }.resume()
    }
}
