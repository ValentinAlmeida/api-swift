import Foundation

//struct DisneyCharacter: Decodable, Hashable {
//    let films: [String]?
//    let name: String?
//    let imageUrl: String?
//    let createdAt: String?
//    let updatedAt: String?
//    
//struct Data : Decodable {
//        
//        let data : [DisneyCharacter]
//    }

//    enum CodingKeys: String, CodingKey {
//        case films
//        case name
//        case imageUrl
//        case createdAt
//        case updatedAt
//    }
//
//    // Customização para lidar com o formato de data do JSON
//    init(from decoder: Decoder) throws {
//        let container = try decoder.container(keyedBy: CodingKeys.self)
//        films = try container.decode([String].self, forKey: .films)
//        name = try container.decode(String.self, forKey: .name)
//        imageUrl = try container.decode(URL.self, forKey: .imageUrl)
//
//        // Formato da data do JSON ("createdAt" e "updatedAt") depende da formatação real fornecida pelo servidor
//        let dateFormatter = DateFormatter()
//        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSZ"
//
//        if let createdAtString = try container.decodeIfPresent(String.self, forKey: .createdAt),
//           let createdAtDate = dateFormatter.date(from: createdAtString) {
//            createdAt = createdAtDate
//        } else {
//            throw DecodingError.dataCorruptedError(forKey: .createdAt, in: container, debugDescription: "Date string invalid or missing")
//        }
//
//        if let updatedAtString = try container.decodeIfPresent(String.self, forKey: .updatedAt),
//           let updatedAtDate = dateFormatter.date(from: updatedAtString) {
//            updatedAt = updatedAtDate
//        } else {
//            throw DecodingError.dataCorruptedError(forKey: .updatedAt, in: container, debugDescription: "Date string invalid or missing")
//        }
//    }
//}
