import Foundation

struct StationResponseModel: Decodable {
  var stations:[Station] { searchInfo.row } //StationResponseModel.stations 로 바로 호출하기 위해서 사용

  private let searchInfo: SearchInfoBySubwayNameServiceModel

  enum CodingKeys: String, CodingKey {
    case searchInfo = "SearchInfoBySubwayNameService"
  }
  struct SearchInfoBySubwayNameServiceModel: Decodable {
    var row: [Station] = []
  }
}

struct Station: Decodable {
  let stationName: String
  let lineNumber: String

  enum CodingKeys: String, CodingKey {
    case stationName = "STATION_NM"
    case lineNumber = "LINE_NUM"
  }
}