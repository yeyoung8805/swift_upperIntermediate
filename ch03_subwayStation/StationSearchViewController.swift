import SnapKit
import UIKit

class StationSearchViewController: UIViewController {
  override func viewDidLoad() {
    super.viewDidLoad()

    navigationController?.navigationBar.prefersLargeTitles = true
    navigationItem.title = "지하철 도착 정보"

    let searchController = UISearchController()
    searchController.searchBar.placeholder = "지하철 역을 입력해주세요."
    searchController.obscuresBackgroundDuringPresentation = false //TODO true 일 때 와의 차이 비교

    navigationItem.searchController = searchController
  }
}