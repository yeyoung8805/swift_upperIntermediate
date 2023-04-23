import SnapKit
import UIKit

final class AppViewController: UIViewController {
  private let scrollView = UIScrollView()
  private let contentView = UIView()

  private lazy var stackView: UIStackView = {
    let stackView = UIStackView()
    stackView.axis = .vertical
    stackView.distribution = .equalSpacing
    stackView.spacing = 0.0

    let featureSectionView = FeatureSectionView(frame: .zero)
    let rankingFeatureSectionView = RankingFeatureSectionView(frame: .zero)
    let exchangeCodeButtonView = UIView()

    exchangeCodeButtonView.backgroundColor = .blue

    [
      featureSectionView,
      rankingFeatureSectionView,
      exchangeCodeButtonView
    ].forEach {
      stackView.addArrangedSubview($0)
    }

    return stackView
  }()

  override func viewDidLoad() {
    super.viewDidLoad()

    setupNavigationController()
    setupLayout()
  }
 
}

private extension AppViewController {
  func setupNavigationController() {
    navigationItem.title = "앱"
    navigationItem.largeTitleDisplayMode = .always
    navigationController?.navigationBar.prefersLargeTitles = true       
  }

  func setupLayout() {
    view.addSubView(scrollView)
    scrollView.snp.makeConstraints {
      $0.top.equalTo(view.safeAreaLayoutGuide.snp.top)
      $0.bottom.equalToSuperView()
      $0.leading.equalToSuperView()
      $0.trailing.equalToSuperView()
    }

    scrollView.addSubView(contentView)
    contentView.snp.makeConstraints {
      $0.edges.equalToSuperView()
      $0.width.equalToSuperView() //세로로 스크롤이 되도록 함.. height 일 경우 가로스크롤
    }

    contentView.addSubView(stackView)
    stackView.snp.makeConstraints {
      $0.edges.equalToSuperView() //모서리들을 contentView에 맞춘다.

    }
  }
}