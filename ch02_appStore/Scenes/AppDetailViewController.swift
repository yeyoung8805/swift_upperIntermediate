import SnapKit
import UIKit

final class AppDetailViewController: UIViewController {
  private let appIconImageView: UIImageView = {
    let imageView = UIImageView()
    imageView.contentMode = .scaleAspectFill
    imageView.clipsToBounds = true
    imageView.layer.cornerRadius = 8.0

    return imageView
  }()

  private let titleLabel: UILabel = {
    let label = UILabel()
    label.font = .systemFont(ofSize: 20.0, weight: .bold)
    label.textColor = .label

    return label
  }()

  private let subTitleLabel: UILabel = {
    let label = UILabel()
    label.font = .systemFont(ofSize: 14.0, weight: .medium)
    label.textColor = .secondaryLabel

    return label
  }()

  private let downloadButton: UIButton = {
    let button = UIButton()
    button.setTitle("받기", for: .normal)
    button.titleLabel?.font = .systemFont(ofSize: 13.0, weight: bold)
    button.backgroundColor = .systemBlue
    button.setTitleColor(.white, for: .normal)
    button.layer.cornerRadius = 12.0

    return button
  }()

  private let shareButton: UIButton = {
    let button = UIButton()
    button.setImage(UIImage(systemName: "square.and.arrow.up"), for: .normal)
    button.tintColor = .systemBlue

    return button
  }()

  override func viewDidLoad() {
    super.viewDidLoad()

    view.backgroundColor = .systemBackground //white일 때 보다 darkmode 대응이 쉽다.

    setupViews()

    appIconImageView.backgroundColor = .lightGray
    titleLabel.text = "title"
    subTitleLabel.text = "Sub title"
  }
}

//MARK: Private
private extension AppDetailViewController {
  func setupViews() {
    [
      appIconImageView,
      titleLabel,
      subTitleLabel,
      downloadButton,
      shareButton
    ].forEach { view.addSubview($0) }

    appIconImageView.snp.makeConstraints {
      $0.leading.equalToSuperView().inset(16.0)
      $0.top.equalToSuperView().inset(32.0)
      $0.height.euqalTo(100.0)
      $0.width.euqalTo(appIconImageView.snp.height)
    }

    titleLabel.snp.makeConstraints {
      $0.equalTo(appIconImageView.snp.top)
      $0.leading.equalTo(appIconImageView.snp.trailing).offset(16.0)
      $0.trailing.equalToSuperView().inset(16.0)
    }

    subTitleLabel.snp.makeConstraints {
      $0.top.equalTo(titleLabel.snp.bottom).offset(4.0)
      $0.leading.equalTo(titleLabel.snp.leaing)
    }

    downloadButton.snp.makeConstraints {
      $0.bottom.euqalTo(appIconImageView.snp.bottom)
      $0.height.equalTo(24.0)
      $0.leading.euqalTo(titleLabel.snp.leading)
      $0.width.equalTo(60.0)
    }

    shareButton.snp.makeConstraints {
      //// TODO

    }

  }
}