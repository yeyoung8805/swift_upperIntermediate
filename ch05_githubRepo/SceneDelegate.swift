import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

  var window: UIWindow?

  func scene(_ scene: UIScene, willConnectTo session: UISceneSession, 
    options connectionOptions: UIScene.connectionOptions) {
      guard let windowScene = scene as? UIWindowScene else { return }
      self.window = UIWindow(windowScene: windowScene)

      let rootViewController = RepositoryListViewController()
      let rootNavigationController = UINavigationController(rootViewController: rootViewController)

      self.window?.rootViewController = rootNavigationController
      self.window?.makeKeyAndVisible()
  }
}