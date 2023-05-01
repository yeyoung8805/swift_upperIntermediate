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
    collectionView.register(
      TodayCollectionHeaderView.self, 
      forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, 
      withReuseIdentifier: "TodayCollectionHeaderView")

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

extension TodayViewController: UICollectionViewDelegateFlowLayout {
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, 
    sizeForItemAt indexPath: IndexPath) -> CGSize {
    let width: CGFloat = collectionView.frame.width - 32.0
    return CGSize(width: width, height: width)
  }

  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, 
    referenceSizeForHeaderInSection section: Int) -> CGSize {
    CGSize(width: collectionView.frame.width - 32.0, height: 100.0)
    }

  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, 
    insetForSectionAt section: Int) -> UIEdgeInsets {
    let value: CGFloat = 16.0  
    return UIEdgeInsets(top: value, left: value, bottom: value, right: value)
  }

  func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
    let vc = AppDetailViewController()
    present(vc, animated: true)
  }

}

extension TodayViewController: UICollectionViewDataSource {
  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    5
  }
  
  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "todayCell", for: indexPath) as? TodayCollectionViewCell
    cell?.setup()
    return cell ?? UICollectionViewCell() // cell 이 nil 일 경우 UICollectionViewCell() 을 넘긴다.
  }

  func collectionView(_ collectionView: UICollectionView,
    viewForSupplementaryElementOfKind kind: String, 
    at indexPath: IndexPath) -> UICollectionReusableView {
    guard 
      kind == UICollectionView.elementKindSectionHeader,
      let header = collectionView.dequeueReusableSupplementaryView(
        ofKind: kind, 
        withReusableIdentifier: 
        "TodayCollectionHeaderView", for: indexPath
      ) as? TodayCollectionHeaderView  
    else {
      return UICollectionReusableView()
    }  

    header.setupViews()
    return header
  }
}