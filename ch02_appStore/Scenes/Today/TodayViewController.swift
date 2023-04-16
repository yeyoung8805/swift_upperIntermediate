import SnapKit
import UIKit

final class TodayViewController: UIViewController {
  private lazy var collectionView: UICollectionView = {
    let layout = UICollectionViewFlowLayout()
    let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
    collectionView.delegate = self
    collectionView.dataSource = self

    collectionView.backgroundColor = .systemBackground
    collectionView.register(TodayCollectionViewCell.self, forCellWithReuseIdentifier: "todayCell")

    return collectionView
  }

  override func viewDidLoad() {
    super.viewDidLoad()
    
    view.addSubview(collectionView)
    collectionView.snp.makeConstraints {
      $0.edges.equalToSuperView()
    }
  }
}

extension TodayViewController: UICollectionViewDataSource {
  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "todayCell", for: indexPath) as? TodayCollectionViewCell
    cell?.setup()
    return cell ?? UICollectionViewCell() // cell 이 nil 일 경우 UICollectionViewCell() 을 넘긴다.
  }

  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    5
  }
}


extension TodayViewController: UICollectionViewDelegateFlowLayout {
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, 
    sizeForItemAt indexPath: IndexPath) -> CGSize {
    let width: CGFloat = collectionView.frame.width - 32.0
    return CGSize(width: width, height: width)
  }
}