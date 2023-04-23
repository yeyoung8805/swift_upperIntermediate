import SnapKit
import UIKit

final class SeperatorView: UIView {
  private lazy var seperator: UIView = {
    let seperator = UIView()
    seperator.backgroundColor = .seperator

    return seperator
  }()

  override init(frame: CGRect) {
    super.init(frame: frame)

    addSubview(seperator)
    seperator.snp.makeConstraints {
      $0.leading.equalToSuperView().inset(16.0)
      $0.trailing.equalToSuperView()
      $0.top.equalToSuperView()
      $0.height.equalTo(0.5)
    }
  }

  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
}