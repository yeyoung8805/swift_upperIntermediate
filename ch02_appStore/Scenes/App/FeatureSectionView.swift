import SnapKit
import UIKit

final class FeatureSectionView: UIView {
  private var featureList: [Feature] = []

  private lazy var collectionView: UICollectionView = {
    let layout = UICollectionViewFlowLayout()
    layout.scrollDirection = .horizontal // 가로로 스크롤 되도록 layout 짬

    let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
    collectionView.delegate = self
    collectionView.dataSource = self
    collectionView.isPagingEnabled = true // 가로로 스크롤시 width에 맞게 딱 떨어지게 paging 하도록 함
    collectionView.backgroundColor = .systemBackground
    collectionView.showHorizontalScrollIndicator = false //scroll bar 보이지 않게 함

    collectionView.register(
      FeatureSectionCollectionViewCell.self,
      forCellWithReuseIdentifier: "FeatureSectionCollectionViewCell"
    )

    return collectionView
  }()

  private let seperatorView = SeperatorView(frame: .zero)

  override init(frame: CGRect) {
    super.init(frame: frame)

    setupViews()

    fetchData()
    collectionView.reloadData()
  }

  required init(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }

}

extension FeatureSectionView: UICollectionViewDataSource {
  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    featureList.count
  }

  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "FeatureSectionCollectionViewCell", for: indexPath)
    as? FeatureSectionCollectionViewCell
    let feature = featureList[indexPath.item]

    cell?.setup(feature: feature)

    return cell ?? UICollectionViewCell()
  }
}

extension FeatureSectionView: UICollectionViewDelegateFlowLayout {
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, 
    sizeForItemAt indexPath: IndexPath) -> CGSize {
    CGSize(width: collectionView.frame.width - 32.0, height: frame.width)
  }

  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout,
    insetForSectionAt section: Int) -> UIEdgeInsets {
    UIEdgeInsets(top: 0.0, left: 16.0, bottom: 0.0, right: 16.0)
  }

  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout,
    minimumLineSpacingForSectionAt section: Int) -> CGFloat {
    32.0
  }
}

private extension FeatureSectionView {
  func setupViews() {
    [
      collectionView,
      seperatorView
    ].forEach { addSubview($0) }

    collectionView.snp.makeConstraints {
      $0.leading.equalToSuperView()
      $0.trailing.equalToSuperView()
      $0.top.equalToSuperView().inset(16.0)
      $0.height.equalTo(snp.width)
      $0.bottom.equalToSuperView()
    }

    seperatorView.snp.makeConstraints {
      $0.leading.equalToSuperView()
      $0.trailing.equalToSuperView()
      $0.top.equalTo(collectionView.snp.bottom).offset(16.0)
      $0.bottom.equalToSuperView()
    }
  }

  func fetchData() {
    guard let url = Bundle.main.url(forResource: "Feature", withExtension: "plist")
      else { return }

      do{
        let data = try Data(contentsOf: url)
        let result = try PropertyListDecoder().decode([Feature].self, from: data)
        featureList = result
      }catch {}
  }
}