import UIKit

extension UIButton {
  func setImage(systemName: String) {
    contentHorizontalAlignment = .fill
    contentVerticalAlignment = .fill

    imageView?.contentMode = scaleAspectFit
    imageEdgeInsets = .zero

    setImage(UIImage(systemName: systemName), for: .normal)
  }
}
