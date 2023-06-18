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

  private let photoDataView = ProfileDataView(title: "게시물", count: 123)
  private let followerDataView = ProfileDataView(title: "팔로워", count: 2_000)
  private let followingDataView = ProfileDataView(title: "팔로잉", count: 1)

  private lazy var collectionView: UICollectionView = {
    let layout = UICollectionViewFlowLayout()
    layout.minimumLineSpacing = 0.5
    layout.minimumInterItemSpacing = 0.5

    let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
    collectionView.backgroundColor = .systemBackground
    collectionView.register(UICollectionView.self, forCellWithReuseIdentifier: "ProfileCollectionViewCell")
    collectionView.datasource = self
    collectionView.delegate = self

    return collectionView
  }()

  override func viewDidLoad() {
    super.viewDidLoad()

    setupNavigationItems()
    setupLayout()
  }
}

//delegate
//datasource

extension ProfileViewController: UICollectionViewDataSource {
  func collectionView(_ collectionView: UICollectionView,
    cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
      let cell = collectionView
        .dequeueReusableCell(
          withReuseIdentifier: "ProfileCollectionViewCell", 
          for: indexPath
        )

      cell.backgroundColor = .lightGray
      return cell
  }

  func collectionView(_ collectionView: UICollectionView,
    numberOfItemsInSection section: Int) -> Int {
      return 10
  }
}

extension ProfileViewController: UICollectionViewDelegateFlowLayout {
  func collectionView(_ collectionView: UICollectionView, 
    layout collectionViewLayout: UICollectionViewLayout, 
    sizeForItemAt indexPath: IndexPath) -> CGSize {
      let width: CGFloat = (collectionView.frame.width / 3) - 1.0
      return CGSize(width: width, height: width)
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

    let dataStackView = UIStackView(arrangedSubviews: 
        [photoDataView, followerDataView, followingDataView])
    dataStackView.spacing = 4.0
    dataStackView.distribution = .fillEqually

    [
      profileImageView, dataStackView, nameLabel, descriptionLabel, buttonStackView, collectionView
    ].forEach{ view.addSubView($0) }

    let inset: CGFloat = 16.0

    profileImageView.snp.makeConstraints {
      $0.top.equalTo(view.safeAreaLayoutGuide).inset(inset)
      $0.leading.equalToSuperview().inset(inset)
      $0.width.equalTo(80.0)
      $0.height.equalTo(profileImageView.snp.width)
    }

    dataStackView.snp.makeConstraints {
      $0.leading.euqalTo(profileImageView.snp.trailing).offset(inset)
      $0.trailing.equalToSuperview().inset(inset)
      $0.centerY.equalTo(profileImageView.snp.centerY)
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

    collectionView.snp.makeConstraints {
      $0.leading.equalToSuperview()
      $0.trailing.equalToSuperview()
      $0.top.equalTo(buttonStackView.snp.button).offset(16.0)
      $0.bottom.equalToSuperview()
    }

  }
}