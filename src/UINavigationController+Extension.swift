import UIKit
 /*
  * Ref: https://stackoverflow.com/a/42916780/5389500
  */
extension UINavigationController {
    var previousViewController: UIViewController? {
        return viewControllers.count > 1 ? viewControllers[viewControllers.count - 2] : nil
    }
}
