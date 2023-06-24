import SnapKit
import UIKit

final class UploadViewController: UIViewController {
  private let imageView = UIImageView()

  private lazy var textView: UITextView = {
    let textView = UITextView()
    textView.font = .systemFont(ofSize: 15.0)

    return textView
  }()

  override func viewDidLoad() {
    super.viewDidLoad()

    view.backgroundColor = .systemBackground
    setupNavigationItem()
    setupLayout()
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

  func setupLayout() {
    [imageView, textView].forEach { view.addSubview($0) }

    let imageViewInset: CGFloat = 16.0

    imageView.snp.makeConstraints {
      $0.top.equalTo(view.safeAreaLayoutGuide).inset(imageViewInset)
      $0.leading.equalToSuperview().inset(imageViewInset)
      $0.width.equalTo(100.0)
      $0.height.equalTo(imageView.snp.width)
    }

    textView.snp.makeConstraints {
      $0.leading.equalTo(imageView.snp.trailing).offset(imageViewInset)
      $0.trailing.equalToSuperview().inset(imageViewInset)
      $0.top.equalTo(imageView.snp.top)
      $0.bottom.equalTo(imageView.snp.bottom)
    }
  }

}