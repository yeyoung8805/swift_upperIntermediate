import UIKit

class TabBarController: UITabBarController {

  private lazy var todayViewController: UIViewController = {
    let viewController = UIViewController()
    return viewController
  }()

  private lazy var appViewController: UIViewController = {
    let viewController = UIViewController()
    return viewController
  }()

  override func viewDidLoad() {
    super.viewDidLoad()

    viewControllers = [todayViewController, appViewController]
  }
}