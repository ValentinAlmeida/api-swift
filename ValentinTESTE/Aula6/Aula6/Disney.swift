import Foundation

struct DisneyCharacter: Decodable, Hashable {
    let films: [String]?
    let name: String?
    let imageUrl: String?
    let createdAt: String?
    let updatedAt: String?
}

