import UIKit
/**
 * Controller related
 */
extension UIView {
    /**
     * Returns a ViewController of a class Kind
     * ## Examples:
     *UIView.vc(vcKind: CustomViewController.self)//ref to an instance of CustomViewController
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
    /*
     * Returns the top most viewController
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
     */
    public func navigationController() -> UINavigationController? {
        guard let controller = controller() else { return nil }
        return controller.navigationController
    }
}
