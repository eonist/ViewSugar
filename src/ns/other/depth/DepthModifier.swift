#if os(OSX)
import Cocoa

class DepthModifier {
   /**
    * Arranges children in PARAM: container according to PARAM: indices
    * - Note: indices contain an array of indec values that is in a spessific order, so if the first index is 6 that means the instance at depth 6 will now have depth 0
    * - Remark: there are now native methods that does this (iOS): bringSubviewToFront(_:), sendSubviewToBack(_:), removeFromSuperview(), insertSubview(_:atIndex:), insertSubview(_:aboveSubview:), insertSubview(_:belowSubview:), exchangeSubviewAtIndex(_:withSubviewAtIndex:)
    */
   static func sortByIndices(_ container: NSView, _ indices: [Int]) {
      Swift.print("DepthModifier.sortByIndices()")
      let children: [NSView] = NSViewParser.childrenOfType(container, NSView.self)
      let indicesLen: Int = indices.count
      for i in 0..<indicesLen {
         container.addSubviewAt(children[indices[i]], i) // <--apparently you don't need to remove a view before adding it again, animation-wise it may be better to remove, did get some ghosting on the stroke*///Fixme: ideally we would use sortSubviewsUsingFunction. But there are no clear examples of anyone using this method in swift yet. It is possibe though, but will require some research
      }
   }
   /**
    * bring subView to the front in containerView
    * ## Examples:
    * bringSubviewToFront(parent:containerView, child: subView)
    */
   public static func bringSubviewToFront(parent: NSView, child: NSView) {
      var theView = child
      parent.sortSubviews({ viewA, viewB, rawPointer in
         let view = rawPointer?.load(as: NSView.self)
         switch view {
         case viewA:
            return ComparisonResult.orderedDescending
         case viewB:
            return ComparisonResult.orderedAscending
         default:
            return ComparisonResult.orderedSame
         }
      }, context: &theView)
   }
}
extension NSView {
   /**
    * bring subView to the front in containerView
    * ## Examples:
    * self.superView?.bringSubviewToFront(self)
    */
   public func bringSubviewToFront(_ view: NSView) {
      DepthModifier.bringSubviewToFront(parent: self, child: view)
   }
}


//forward
//backward
//swap
//sort
//sortOn
//sortByList
//toFront<--if you set index to nil in the addSubView method
//toBack

#endif
