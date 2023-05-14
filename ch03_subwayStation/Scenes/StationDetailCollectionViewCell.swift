import SnapKit
import UIKit

final class StationDetailCollectionViewCell: UICollectionViewCell {
  private lazy var lineLabel: UILabel = {
    let label = UILabel()
    label.font = .systemFont(ofSize: 15.0, weight: .bold)

    return label
  }()

  private lazy var remainTimeLabel: UILabel = {
    let label = UILabel()
    label.font = .systemFont(ofSize: 15.0, weight: .medium)

    return label
  }()

  func setup() {
    layer.cornerRadius = 12.0
    layer.shadowColor = UIColor.black.cgColor
    layer.shadowOpacity = 0.2
    layer.shadowRadius = 10

    backgroundColor = .systemBackground

    //label 들의 레이아웃 설정
    [lineLabel, remainTimeLabel].forEach { addSubview($0) }

    lineLabel.snp.makeConstraints { 
      $0.leading.equalToSuperView().inset(16.0)
      $0.top.equalToSuperView().inset(16.0)
    }

    remainTimeLabel.snp.makeConstraints {
      $0.leading.equalTo(lineLabel)
      $0.top.equalTo(lineLabel.snp.bottom).offset(16.0)
      $0.bottom.equalToSuperView().inset(16.0)
    }

    lineLabel.text = "한양대 방면"
    remainTimeLabel.text = "뚝섬 도착"
  }
}