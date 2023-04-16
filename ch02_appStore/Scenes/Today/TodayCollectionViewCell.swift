import SnapKit
import UIKit

final class TodayCollectionViewCell: UICollectionViewCell {

  private lazy var titleLabel: UILabel = {
    let label = UILabel()
    label.font = .systemFont(ofSize: 24.0, weight: .bold)
    label.textColor = .white

    return label
  }

  private lazy var subTitleLabel: UILabel = {
    let label = UILabel()
    label.font = .systemFont(ofSize: 14.0, weight: .bold)
    label.textColor = .white

    return label
  }

  private lazy var descriptionLabel: UILabel = {
    let label = UILabel()
    label.font = .systemFont(ofSize: 14.0, weight: .bold)
    label.textColor = .white

    return label
  }

  private lazy var imageView: UIImageView = {
    let imageView = UIImageView()
    imageView.contentMode = .scaleAspectFill
    imageView.clipsToBounds = true
    imageView.layer.cornerRadius = 12.0
    imageView.backgroundColor = .gray

    return imageView
  }

  func setup() {
    setupSubViews()

    subTitleLabel.text = "서브 타이틀"
    descriptionLabel.text = "설명설명"
    titleLabel.text = "앱의 이름"
  }
}

private extension TodayCollectionViewCell {
  func setupSubViews() {
    [imageView, titleLabel, subTitleLabel, descriptionLabel]
      .forEach { addSubview($0) }

    subTitleLabel.snp.makeConstraints {
      $0.leading.equalToSuperView().insert(24.0)
      $0.trailing.equalToSuperView().insert(24.0)
      $0.top.equalToSuperView().insert(24.0)
    }

    titleLabel.snp.makeConstraints {
      $0.leading.equalTo(subTitleLabel)
      $0.trailing.equalTo(subTitleLabel)
      $0.top.equalTo(subTitleLabel.snp.bottom).offset(4.0)
    }

    descriptionLabel.snp.makeConstraints {
      $0.leading.equalToSuperView().insert(24.0)
      $0.trailing.equalToSuperView().insert(24.0)
      $0.top.equalToSuperView().insert(24.0)
    }

    imageView.snp.makeConstraints {
      $0.edges.equalToSuperView()
    }


  }
}