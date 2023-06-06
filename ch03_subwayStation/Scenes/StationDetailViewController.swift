import Alamofire
import SnapKit
import UIKit

final class StationDetailViewController: UIViewController {
  private let station: Station
  private var realtimeArrivalList: [StationArrivalDataResponseModel.RealTimeArrival] = []

  private lazy var refreshControl: UIRefreshControl = {
    let refreshControl = UIRefreshControl()
    refreshControl.addTarget(self, action: #selector(fetchData), for: .valueChanged)

    return refreshControl
  }()

  @objc private func fetchData() {
    //"~역"을 제거해주는 코드 추가 
    let stationName = station.stationName
    let urlString = "http://swopenapi.seoul.go.kr/api/subway/sample/json/realtimeStationArrival/0/5/\(stationName.replacingOccurences(of: "역", with: ""))"

    AF.request(urlString.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) ?? "")
      .responseDecodable(of: StationArrivalDataResponseModel.self) { [weak self] response in
        self.refreshControl.endRefreshing() //refreshing 을 멈추는 코드는 success/fail(=else)와 상관없이 필요하므로 그 위에 선언한다!
        guard case .success(let data) = response.result else { return }

        self?.realtimeArrivalList = data.realtimeArrivalList
        self?.collectionView.reloadData()
      }
      .resume()
  }

  private lazy var collectionView: UICollectionView = {
    let layout = UICollectionViewFlowLayout()
    layout.estimatedItemSize = CGSize(
      width: view.frame.width - 32.0, 
      height: 100.0)
    layout.sectionInset = UIEdgeInsets(top: 16.0, left: 16.0, bottom: 16.0, right: 16.0)
    layout.scrollDirection = .vertical

    let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
    collectionView.backgroundColor = .systemBackground
    collectionView.register(StationDetailCollectionViewCell.self,
      forCellWithReuseIdentifier: "StationDetailCollectionViewCell")

    collectionView.dataSource = self
    collectionView.refreshControl = refreshControl
    
    return collectionView
  }()

  init(station: Station) {
    self.station = station
    super.init(nibName: nil, bundle: nil)
  }

  override func viewDidLoad() {
    super.viewDidLoad()

    navigationItem.title = station.stationName

    view.addSubview(collectionView)
    collectionView.snp.makeConstraints { $0.edges.equalToSuperView() }

    fetchData()
  }
}

extension StationDetailViewController: UICollectionViewDataSource {
  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return realtimeArrivalList.count
  } 

  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    let cell = collectionView.dequeueReusableCell(
      withReuseIdentifier: "StationDetailCollectionViewCell", 
      for: indexPath
    ) as? StationDetailCollectionViewCell

    let realTimeArrival = realtimeArrivalList[indexPath.row]
    cell?.setup(with: realTimeArrival)

    return cell ?? UICollectionViewCell()
  } 
}