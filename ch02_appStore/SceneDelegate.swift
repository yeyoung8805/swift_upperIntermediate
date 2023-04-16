import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
  var window: UIWindow?

  func scene(_ scene: UIScene, willConnectTo session: UISceneSession, 
    options connectionOptions: UIScene.connectionOptions) {
    guard let _ = (scene as? UIWindowScene) else { return } 
  }
}