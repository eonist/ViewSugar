#if os(OSX)
import Cocoa
/**
 * - Fixme: ⚠️️ you can also just cast to NSView! So remove this class
 */
protocol ViewKind: AnyObject { /* the :class enables you to set variables via extension etc*/
   var layer: CALayer? { get }//- Fixme: remove?
   var bounds: NSRect { get }
   var frame: NSRect { get set }
   func addSubview(_ aView: NSView)
}
#endif
