import Foundation

struct Respository: Decodable {
  let id: Int
  let name: String
  let description: String
  let stargazersCount: Int
  let language: String
  enum CodingKeys: String, CodingKey {
    case id, name, description, language
    case stargazersCount = "stargazers_count"
  }
}