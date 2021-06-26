#if os(iOS)
import UIKit

extension UIViewController {
   /**
    * Custom viewController slide transition
    * - Note: Use fromRight to go <-
    * - Note: Use fromLeft to go ->
    * - Fixme: ⚠️️ Figure out what transition.fillMode does?
    */
   static func transition(direction: CATransitionSubtype, type: CATransitionType = .push) -> CATransition {
      let transition = CATransition()
      transition.duration = 0.5
      transition.type = type
      transition.subtype = direction
      transition.timingFunction = .init(name: .easeInEaseOut)
      return transition
   }
   /**
    * ⚠️️ untest
    */
   static func topViewController(_ viewController: UIViewController? = UIApplication.shared.keyWindow?.rootViewController) -> UIViewController? {
      if let nav = viewController as? UINavigationController {
         return topViewController(nav.visibleViewController)
      }
      if let tab = viewController as? UITabBarController {
         if let selected = tab.selectedViewController {
            return topViewController(selected)
         }
      }
      if let presented = viewController?.presentedViewController {
         return topViewController(presented)
      }
      
      return viewController
   }
}
#endif
