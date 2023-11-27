import Foundation
import MapKit

struct Location: Identifiable, Equatable {
    // Protocolo Equatable - permite comparar duas instâncias de Location
    static func == (lhs: Location, rhs: Location) -> Bool {
        return lhs.id == rhs.id // Compara os IDs para verificar se duas instâncias são iguais
    }

    // Propriedade identificadora única para cada instância de Location
    let id = UUID()

    // Propriedades que representam informações sobre um local
    let name: String // Nome do local
    let coordinate: CLLocationCoordinate2D // Coordenadas do local
    let flagIcon: String // Ícone de bandeira associado ao local (representado como um emoji)
    let description: String // Descrição do local
}

// Função que cria e retorna um array de instâncias de Location representando diferentes países
func createLocations() -> [Location] {
    // Criação de instâncias de Location para diferentes países com suas respectivas informações
    let brazil = Location(name: "Brasil", coordinate: CLLocationCoordinate2D(latitude: -14.2350, longitude: -51.9253), flagIcon: "🇧🇷", description: "País na América do Sul")
    let argentina = Location(name: "Argentina", coordinate: CLLocationCoordinate2D(latitude: -38.4161, longitude: -63.6167), flagIcon: "🇦🇷", description: "País na América do Sul")
    let chile = Location(name: "Chile", coordinate: CLLocationCoordinate2D(latitude: -35.6751, longitude: -71.5430), flagIcon: "🇨🇱", description: "País na América do Sul")
    let usa = Location(name: "Estados Unidos", coordinate: CLLocationCoordinate2D(latitude: 37.0902, longitude: -95.7129), flagIcon: "🇺🇸", description: "País na América do Norte")
    let portugal = Location(name: "Portugal", coordinate: CLLocationCoordinate2D(latitude: 39.3999, longitude: -8.2245), flagIcon: "🇵🇹", description: "País na Europa")
    let china = Location(name: "China", coordinate: CLLocationCoordinate2D(latitude: 35.8617, longitude: 104.1954), flagIcon: "🇨🇳", description: "País na Ásia")
    let italy = Location(name: "Itália", coordinate: CLLocationCoordinate2D(latitude: 41.8719, longitude: 12.5674), flagIcon: "🇮🇹", description: "País na Europa")
    let france = Location(name: "França", coordinate: CLLocationCoordinate2D(latitude: 46.6034, longitude: 1.8888), flagIcon: "🇫🇷", description: "País na Europa")
    
    // Retorna um array contendo as instâncias de Location criadas acima
    return [brazil, argentina, chile, usa, portugal, china, italy, france]
}
