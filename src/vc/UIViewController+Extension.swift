import UIKit

extension UIViewController {
   /**
    * Custom viewController slide transition
    * - Note: use fromRight to go 👈
    * - Note: use fromLeft to go 👉
    */
   static func transition(direction: CATransitionSubtype) -> CATransition {
      return with(.init()) {
         $0.duration = 0.5
         $0.type = .push
         $0.subtype = direction
         $0.timingFunction = .init(name: CAMediaTimingFunctionName.easeInEaseOut)
      }
   }
}
