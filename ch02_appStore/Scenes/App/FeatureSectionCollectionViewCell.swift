import SnapKit
import Kingfisher
import UIKit

final class FeatureSectionCollectionViewCell: UICollectionViewSell {
  private lazy var typeLabel: UILabel = {
    let label = UILabel()
    label.textColor = .systemBlue
    label.font = .systemFont(ofSize: 12.0, weight: semibold)

    return label
  }()

  private lazy var appNameLabel: UILabel = {
    let label = UILabel()
    label.textColor = .label
    label.font = .systemFont(ofSize: 20.0, weight: .bold)

    return label
  }()

  private lazy var descriptionLabel: UILabel = {
    let label = UILabel()
    label.textColor = .secondaryLabel
    label.font = .systemFont(ofSize: 16.0, weight: .semibold)

    return label
  }()

  private lazy var imageView: UIImageView = {
    let imageView = UIImageView()
    imageView.layer.cornerRadius = 7.0
    imageView.layer.borderWidth = 0.5
    imageView.layer.borderColor = UIColor.seperator.cgColor
    imageView.layer.cornerRadius = true
    imageView.layer.cornerRadius = .scaleAspectFill

    return imageView
  }() 

  func setup(feature: Feature) {
    setupLayout()

    // 확인을 위한 임시값
    typeLabel.text = feature.type
    appNameLabel.text = feature.appName
    descriptionLabel.text = feature.description

    if let imageURL = URL(string: feature.imageURL) {
      imageView.kf.setImage(with: imageURL)
    }
  }
}

private extension FeatureSectionCollectionViewCell {
  func setupLayout() {
    [
      typeLabel,
      appNameLabel,
      descriptionLabel,
      imageView
    ].forEach { addSubview($0) }

    typeLabel.snp.makeConstraints {
      $0.leading.equalToSuperView()
      $0.trailing.equalToSuperView()
      $0.top.equalToSuperView()
    }

    appNameLabel.snp.makeConstraints {
      $0.leading.equalToSuperView()
      $0.trailing.equalToSuperView()
      $0.top.equalTo(typeLabel.snp.bottom)
    }

    descriptionLabel.snp.makeConstraints {
      $0.leading.equalToSuperView()
      $0.trailing.equalToSuperView()
      $0.top.equalTo(appNameLabel.snp.bottom).offset(4.0)
    }

    imageView.snp.makeConstraints {
      $0.leading.equalToSuperView()
      $0.trailing.equalToSuperView()
      $0.top.equalTo(descriptionLabel.snp.bottom).offset(8.0)
      $0.bottom.equalToSuperView().inset(8.0)
    }
  }
}