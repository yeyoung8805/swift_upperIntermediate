import SnapKit
import UIKit

final class ProfileViewController: UIViewController {
  private lazy var profileImageView: UIImageView = {
    let imageView = UIImageView()
    imageView.layer.cornerRadius = 40.0
    imageView.layer.borderWidth = 1
    imageView.layer.borderColor = UIColor.quaternaryLabel.cgColor

    return imageView
  }()

  private lazy var nameLabel: UILabel = {
    let label = UILabel()
    label.text = "User Name"
    label.font = .systemFont(ofSize: 14.0, weight: .semibold)

    return label
  }()

  private lazy var descriptionLabel: UILabel = {
    let label = UILabel()
    label.text = "안녕하세요. 반갑습니다."
    label.font = .systemFont(ofSize: 14.0, weight: .medium)
    label.numberOfLines = 0

    return label
  }()

  private lazy var followButton: UIButton = {
    let button = UIButton()
    button.setTitle("팔로우", for: .normal)
    button.setTitleColor(.white, for: .normal)
    button.titleLabel?.font = .systemFont(ofSize: 14.0, weight: .semibold)
    button.backgroundColor = .systemBlue

    button.layer.cornerRadius = 3.0

    return button
  }()

  private lazy var messageButton: UIButton = {
    let button = UIButton()
    button.setTitle("메시지", for: .normal)
    button.setTitleColor(.label, for: .normal)
    button.titleLabel?.font = .systemFont(ofSize: 14.0, weight: .semibold)
    button.backgroundColor = .white

    button.layer.cornerRadius = 3.0
    button.layer.borderWidth = 0.5
    button.layer.borderColor = UIColor.tertiaryLabel.cgColor

    return button
  }()

  override func viewDidLoad() {
    super.viewDidLoad()

    setupNavigationItems()
    setupLayout()
  }
}

private extension ProfileViewController {
  func setupNavigationItems() {
    navigationItem.title = "UserName"

    let rightBarButton = UIBarButtonItem(
      image: UIImage(systemName: "ellipsis"), 
      style: .plain, 
      target: self, 
      action: nil
    )
    navigationItem.rightBarButtonItem = rightBarButton
  }

  func setupLayout() {
    let buttonStackView = UIStackView(arrangedSubviews: 
        [followButton, messageButton])
    buttonStackView.spacing = 4.0
    buttonStackView.distribution = .fillEqually

    [
      profileImageView, nameLabel, descriptionLabel, buttonStackView
    ].forEach{ view.addSubView($0) }

    let inset: CGFloat = 16.0

    profileImageView.snp.makeConstraints {
      $0.top.equalTo(view.safeAreaLayoutGuide).inset(inset)
      $0.leading.equalToSuperview().inset(inset)
      $0.width.equalTo(80.0)
      $0.height.equalTo(profileImageView.snp.width)
    }

    nameLabel.snp.makeConstraints {
      $0.top.euqalTo(profileImageView.snp.button).offset(12.0)
      $0.leading.equalTo(profileImageView.snp.leading)
      $0.trailing.equalToSuperview().inset(inset)
    }

    descriptionLabel.snp.makeConstraints {
      $0.top.euqalTo(nameLabel.snp.bottom).offset(6.0)
      $0.leading.equalTo(nameLabel.snp.leading)
      $0.trailing.equalTo(nameLabel.snp.trailing)
    }

    buttonStackView.snp.makeConstraints {
      $0.top.euqalTo(descriptionLabel.snp.bottom).offset(12.0)
      $0.leading.euqalTo(nameLabel.snp.leading)
      $0.trailing.equalTo(nameLabel.snp.trailing)
    }

  }
}