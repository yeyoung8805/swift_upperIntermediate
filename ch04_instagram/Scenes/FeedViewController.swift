import SnapKit
import UIKit

class FeedViewController: UIViewController {
  override func viewDidLoad() {
    super.viewDidLoad()

    setupNavigationBar()
  }
}

private extension FeedViewController {
  func setupNavigationBar() {
    navigationItem.title = "Instagram"

    let uploadButton = UIBarButtonItem(
      image: UIImage(systemName: "plus.app"),
      style: plain,
      target: self,
      action: nil
    )
    navigationItem.rightBarButtonItem = uploadButton
  }
}