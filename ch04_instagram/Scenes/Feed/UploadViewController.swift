import SnapKit
import UIKit

final class UploadViewController: UIViewController {
  override func viewDidLoad() {
    super.viewDidLoad()

    view.backgroundColor = .systemBackground
    setupNavigationItem()
  }
}

private extension UploadViewController {
  func setupNavigationItem() {
    navigationItem.title = "새 게시물"
    navigationItem.leftBarButtonItem = UIBarButtonItem(
      title: "취소", 
      style: .plain, 
      target: self, 
      action: #selector(didTapLeftButton)
    )
    navigationItem.rightBarButtonItem = UIBarButtonItem(
      title: "공유", 
      style: .plain, 
      target: self, 
      action: #selector(didTapRightButton)
    )
  }

  @objc func didTapLeftButton() {
    dismiss(animated: true)
  }

  @objc func didTapRightButton() {
    //TODO: 저장하기 기능추가 필요
    dismiss(animated: true)
  }
}