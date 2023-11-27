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
    let brazil = Location(name: "Brasil", coordinate: CLLocationCoordinate2D(latitude: -14.2350, longitude: -51.9253), flagIcon: "🇧🇷", description: "País localizado na América do Sul, conhecido por sua diversidade cultural, vasta extensão territorial, e grande diversidade geográfica, abrangendo desde a Floresta Amazônica até extensas praias tropicais.")
    let argentina = Location(name: "Argentina", coordinate: CLLocationCoordinate2D(latitude: -38.4161, longitude: -63.6167), flagIcon: "🇦🇷", description: "País sul-americano conhecido por sua cultura rica e diversificada, bem como por paisagens que variam de geleiras no sul a regiões subtropicais no norte. Buenos Aires, sua capital, é famosa por sua arquitetura europeia e vida noturna vibrante.")
    let chile = Location(name: "Chile", coordinate: CLLocationCoordinate2D(latitude: -35.6751, longitude: -71.5430), flagIcon: "🇨🇱", description: "Localizado no extremo sul da América do Sul, o Chile é conhecido por sua paisagem diversificada, que inclui o deserto do Atacama, florestas, lagos e montanhas. É famoso também pela produção de vinhos e pela cordilheira dos Andes.")
    let usa = Location(name: "Estados Unidos", coordinate: CLLocationCoordinate2D(latitude: 37.0902, longitude: -95.7129), flagIcon: "🇺🇸", description: "Uma nação na América do Norte, os Estados Unidos são conhecidos por sua diversidade cultural, tecnológica e geográfica. O país abrange uma vasta gama de paisagens, desde praias tropicais até grandes cidades e vastas planícies.")
    let portugal = Location(name: "Portugal", coordinate: CLLocationCoordinate2D(latitude: 39.3999, longitude: -8.2245), flagIcon: "🇵🇹", description: "País localizado no sudoeste da Europa, conhecido por sua rica história, cidades encantadoras, litorais deslumbrantes e influências culturais que se estendem por todo o mundo devido ao seu passado colonial.")
    let china = Location(name: "China", coordinate: CLLocationCoordinate2D(latitude: 35.8617, longitude: 104.1954), flagIcon: "🇨🇳", description: "País na Ásia Oriental conhecido por sua história milenar, cultura diversificada e contribuições significativas para a civilização. A China é também conhecida por suas grandes cidades modernas, paisagens naturais e influência econômica global.")
    let italy = Location(name: "Itália", coordinate: CLLocationCoordinate2D(latitude: 41.8719, longitude: 12.5674), flagIcon: "🇮🇹", description: "País localizado no sul da Europa, conhecido por sua história rica, arte, arquitetura, gastronomia e moda. A Itália é o lar de cidades icônicas como Roma, Veneza, Florença e Milão.")
    let france = Location(name: "França", coordinate: CLLocationCoordinate2D(latitude: 46.6034, longitude: 1.8888), flagIcon: "🇫🇷", description: "País europeu conhecido por sua cultura refinada, arte, culinária, moda e história. A França abriga a icônica Torre Eiffel, a cidade da luz (Paris), além de paisagens deslumbrantes em regiões como a Provence e a Riviera Francesa.")
    
    // Retorna um array contendo as instâncias de Location criadas acima
    return [brazil, argentina, chile, usa, portugal, china, italy, france]
}
