import SnapKit
import UIKit

final class TodayCollectionHeaderView: UICollectionReusableView {
  private lazy var dateLabel: UILabel = {
    let label = UILabel()
    label.text = "6월 28일 월요일"
    label.font = .systemFont(ofSize: 14.0, weight: .semibold)
    label.textColor = .secondaryLabel

    return label
  }()

  private lazy var titleLabel: UILabel = {
    let label = UILabel()
    label.text = "투데이"
    label.font = .systemFont(ofSize: 36.0, weight: .black)
    label.textColor = .label

    return label
  }()

  func setupViews() {
    [dateLabel, titleLabel].forEach { addSubview($0) }

    dateLabel.snp.makeConstraints {
      $0.leading.equalToSuperView().inset(16.0)
      $0.trailing.equalToSuperView()
      $0.top.equalToSuperView().inset(32.0)
    }

    titleLabel.snp.makeConstraints {
      $0.leading.equalTo(dateLabel)
      $0.top.equalTo(dateLabel.snp.bottom).offset(8.0)
    }
  }
}