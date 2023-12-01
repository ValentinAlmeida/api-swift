import Foundation

// Estrutura representando um usuário do estacionamento, adotando os protocolos Decodable e Hashable
struct Estacionamento: Decodable, Hashable {
    let _id: String?                  // Identificador único do estacionamento (recomenda-se utilizar um nome mais descritivo para a variável)
    let nomeEstacionamento: String? // Nome do estacionamento associado ao usuário
    let endereco: String?          // Endereço do estacionamento (possivelmente URL da imagem do estacionamento)
    let vagas: Int?                // Quantidade de vagas no estacionamento
    let carros: [Carro]?           // Lista de carros associados ao estacionamento (pluralizado o nome da variável para refletir o tipo de dados que armazena)

    // Nota: Considerando que 'Carros' está como um tipo opcional, caso represente um array vazio, recomenda-se utilizar um tipo de dados padrão ou usar um valor padrão para evitar opcional
}
