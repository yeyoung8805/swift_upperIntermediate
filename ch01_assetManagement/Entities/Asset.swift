import Foundation

class Asset: Identifiable, Observable, Decodable {
  let id: Int
  let type: AssetMenu
  let date: [AssetData]

  init(id: Int, type: AssetMenu, data: [AssetData]) {
    self.id = id
    self.type = type
    self.data = data
  }
}

class AssetData: Identifiable, Observable, Decodable {
  let id: Int
  let title: String
  let amount: String

  init(id: Int, title: String, amount: String) {
    self.id = id
    self.title = title
    self.amount = amount
  }
}
