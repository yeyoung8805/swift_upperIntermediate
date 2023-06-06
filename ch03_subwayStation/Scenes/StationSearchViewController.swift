import Alamofire
import SnapKit
import UIKit

class StationSearchViewController: UIViewController {
  private var stations: [Station] = []

  private lazy var tableView: UITableView = {
    let tableView = UITableView()
    tableView.dataSource = self
    tableView.delegate = self
    tableView.isHidden = true

    return tableView()
  }

  override func viewDidLoad() {
    super.viewDidLoad()

    setNavigationItems()
    setTableViewLayout()

  }

  private func setNavigationItems() {
    navigationController?.navigationBar.prefersLargeTitles = true
    navigationItem.title = "지하철 도착 정보"

    let searchController = UISearchController()
    searchController.searchBar.placeholder = "지하철 역을 입력해주세요."
    searchController.obscuresBackgroundDuringPresentation = false //TODO true 일 때 와의 차이 비교 (false = 회색 어둡게 하지 않음)
    searchController.searchBar.delegate = self

    navigationItem.searchController = searchController
  }

  private func setTableViewLayout() {
    view.addSubview(tableView)
    tableView.snp.makeConstraints{ $0.edges.equalToSuperView() }
  }

  private func requestStationName(from stationName: String) {
    let urlString = "http://openapi.seoul.go.kr:8088/sample/json/SearchInfoBySubwayNameService/1/5/\(stationName)"

    AF.request(urlString.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) ?? "")
      .responseDecodable(of: StationResponseModel.self) { [weak self] response in
        guard 
          let self = self,
          case .success(let data) = response.result 
        else { return }

        self.stations = data.stations
        self.tableView.reloadData()
      }
      .resume()
  }
}

extension StationSearchViewController: UISearchBarDelegate {
  func searchBarTextDidBeginEditing(_ searchBar: UISearchBar) {
    tableView.reloadData()
    tableView.isHidden = false // tableView 가 보이기 시작
  }

  func searchBarTextDidEndEditing(_ searchBar: UISearchBar) {
    tableView.isHidden = true // tableView 가 보이지 않게 됨
    stations = [] //입력후 조회하는 과정이 끝나면 리스트도 비워지게 함
  }

  func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
    requestStationName(from: searchText)
  }
}

extension StationSearchViewController: UITableViewDelegate {
  func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    let vc = StationDetailViewController()
    navigationController?.pushViewController(vc, animated: true)
  }
}

extension StationSearchViewController: UITableViewDataSource {
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return stations.count
  }

  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = UITableViewCell(style: .subtitle, reuseIdentifier: "Cell")
    let station = stations[indexPath.row]
    cell.textLabel?.text = station.stationName
    cell.detailTextLabel?.text = station.lineNumber

    return cell
  }
}