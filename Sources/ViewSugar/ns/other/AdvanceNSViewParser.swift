#if os(OSX)
import Cocoa

class AdvanceNSViewParser {
   /**
    * - Fixme: not optimized very well
    * Returns depths of every NSView instance in PARAM: views
    */
   static func indicesOfViews(_ container: NSView, _ views: [NSView]) -> [[Int]] {
      views.map { NSViewParser.index(container, $0)! }
   }
   /**
    * Returns an NSView instance at PARAM: index in PARAM: container
    * - NOTE: this function is recursive
    * - fixme: ⚠️️ rename index to map?, move to AdvanceDisplayObjectParser?
    * - Fixme: ⚠️️ out of order
    */
   static func getAt(_ container: NSView?, _ index: [Int]) -> NSView? {
      fatalError("⚠️️ out of order")
//      if index.isEmpty && container != nil {
//         Swift.print("a")
//         return container!
//      }
//      else if index.count == 1 && container!.numSubViews > 0 {
//         Swift.print("b")
//         return container?.getSubViewAt(index[0])!
//      }
//      else if index.count > 1 && container!.numSubViews > 0 && container!.getSubViewAt(index[0])!.numSubViews > 0/*<--i'm unsure about this last assert*/ {
//         Swift.print("c")
//         return getAt(container!.getSubViewAt(index[0]), index.slice2(1, index.count))
//      } else {
//         Swift.print("d")
//         return nil
//      }
   }
}
#endif
