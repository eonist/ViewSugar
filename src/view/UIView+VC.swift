import UIKit

/**
 * Controller related
 */
extension UIView {
   /**
      * Traverses the entire UIView hirearchy downwards and collects views that are of speccific PARAM: type
      * - Fixme: ⚠️️ this can be written more elegantly with flatMap
      */
     func descendants<T>(type: T.Type? = nil) -> [T] {
         var subViewsOfType: [T] = []
         self.subviews.forEach {
             if let subView: T = ($0 as? T) {
                 subViewsOfType.append(subView)
             }
             if !$0.subviews.isEmpty {
                 subViewsOfType += $0.descendants(type: type)
             }
         }
         return subViewsOfType
     }
   /**
    * Returns a ViewController of a class Kind
    * ## Examples:
    * UIView.vc(vcKind: CustomViewController.self) // ref to an instance of CustomViewController
    * - Fixme: move out of this extension
    */
   public static func vc<T: UIViewController>(vcKind: T.Type? = nil) -> T? {
      guard let appDelegate = UIApplication.shared.delegate, let window = appDelegate.window else { return nil }
      if let vc = window?.rootViewController as? T {
         return vc
      } else if let vc = window?.rootViewController?.presentedViewController as? T {
         return vc
      } else if let vc = window?.rootViewController?.children {
         return vc.lazy.compactMap { $0 as? T }.first
      }
      return nil
   }
   /**
    * Returns the top most viewController
    * ## Examples:
    * self.topMostController()?.view.backgroundColor = .green
    * - Fixme: move out of this extension
    */
   public static func topMostController() -> UIViewController? {
      var topController: UIViewController? = UIApplication.shared.keyWindow?.rootViewController
      while topController?.presentedViewController != nil {
         topController = topController?.presentedViewController!
      }
      return topController
   }
   /**
    * Returns parent viewController
    * ## Examples:
    * self.parentViewController?.view.backgroundColor = .green
    */
   public var parentViewController: UIViewController? {
      var parentResponder: UIResponder? = self
      while parentResponder != nil {
         parentResponder = parentResponder!.next
         if let viewController = parentResponder as? UIViewController {
            return viewController
         }
      }
      return nil
   }
   /**
    * Easily get Controller
    * - Fixme: ⚠️️ make this a var?
    */
   public func controller() -> UIViewController? {
      if let nextViewControllerResponder = next as? UIViewController {
         return nextViewControllerResponder
      } else if let nextViewResponder = next as? UIView {
         return nextViewResponder.controller()
      } else {
         return nil
      }
   }
   /**
    * Easily get navController from
    * - Fixme: ⚠️️ make this a var?
    */
   public func navigationController() -> UINavigationController? {
      guard let controller = controller() else { return nil }
      return controller.navigationController
   }
}
